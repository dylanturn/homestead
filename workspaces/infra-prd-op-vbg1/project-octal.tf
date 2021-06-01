# 1. Configure OIDC auth and cluster access.
module "oidc_rbac" {
  source = "git::https://github.com/project-octal/terraform-kubernetes-api-oidc-auth.git"

  oidc_cluster_role_bindings = [
    {
      cluster_role_name = "cluster-admin"
      oidc_group_name   = "kubernetes-arroyo-admins"
    }
  ]
}

# 2. Now we deploy/update the clusters ingress controller.
module "traefik" {
  source                               = "git::https://github.com/project-octal/terraform-kubernetes-traefik.git"
  image_tag                            = "2.4.8"
  namespace                            = "kube-traefik"
  log_level                            = "INFO"
  replicas                             = 2
  rolling_update_max_surge             = 1
  rolling_update_max_unavailable       = 1
  pod_termination_grace_period_seconds = 1
  service_type                         = "LoadBalancer"
  preferred_node_selector              = []
}

# 3. Deploy the certificate manager so that we can generate valid certs for our ingresses
module "cert_manager" {
  source = "github.com/project-octal/terraform-kubernetes-cert-manager"

  certificate_issuers = {
    letsencrypt = {
      name              = "letsencrypt-prod"
      server            = "https://acme-v02.api.letsencrypt.org/directory"
      email             = "dylanturn@gmail.com"
      secret_base64_key = var.letsencrypt_secret_base64_key
      default_issuer : true,
      ingress_class = module.traefik.ingress_class
    }
  }
}

# 4. Lastly, deploy/update the CICD orchestrator.
module "argocd" {
  source = "git::https://github.com/project-octal/terraform-kubernetes-argocd.git"

  argocd_url       = "argocd.arroyo.turnbros.app"
  argocd_image_tag = "v1.8.7"

  namespace              = "kube-argocd"
  argocd_server_replicas = 2
  argocd_repo_replicas   = 2

  enable_dex      = false
  enable_ha_redis = false

  cluster_cert_issuer = module.cert_manager.cert_issuer
  ingress_class       = module.traefik.ingress_class

  repo_server_exec_timeout = "300"
  argocd_repositories = [
    #{
    #  type = "git"
    #  url  = "https://github.com/opendistro-for-elasticsearch/opendistro-build.git"
    #}
  ]

  oidc_config = {
    name                      = var.argocd_oidc_name
    issuer                    = var.argocd_oidc_issuer
    client_id                 = var.argocd_oidc_client_id
    client_secret             = var.argocd_oidc_client_secret
    requested_scopes          = var.argocd_oidc_requested_scopes
    requested_id_token_claims = var.argocd_oidc_requested_id_token_claims
  }
}
