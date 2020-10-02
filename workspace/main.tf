# 1. First we're going to want to deploy/update our security enforcement layer.
# TODO: Finish this module.
#module "open_policy_agent" {
#    source = "github.com/dylanturn/terraform-kubernetes-opa-gatekeeper"
#    namespace = var.opa_namespace
#}

# 2. Next we need to deploy/update the clusters service mesh.
# TODO: Finish this module.
#module "linkerd" {
#    source = "github.com/dylanturn/terraform-kubernetes-linkerd"
#    depends_on = [module.open_policy_agent]
#    namespace = var.linkerd_namespace
#}

# 3. Now we deploy/update the clusters ingress controller.
# TODO: Finish this module.
#module "traefik" {
#    source = "github.com/dylanturn/terraform-kubernetes-traefik"
#    depends_on = [module.open_policy_agent, module.linkerd]
#    namespace = var.traefik_namespace
#}

# 4. Lastly, deploy/update the CICD orchestrator.
# TODO: Pat myself on the back for getting this to work.
module "argocd" {
  source = "github.com/dylanturn/terraform-kubernetes-argocd"
  #  depends_on = [module.open_policy_agent, module.linkerd, module.traefik]

  namespace = var.argocd_namespace

  argocd_server_replicas = var.argocd_server_replicas
  argocd_repo_replicas   = var.argocd_repo_replicas
  enable_dex             = var.argocd_enable_dex
  enable_ha_redis        = var.argocd_enable_ha_redis

  oidc_config = {
    name                      = var.argocd_oidc_name,
    issuer                    = var.argocd_oidc_issuer,
    client_id                 = var.argocd_oidc_client_id,
    client_secret             = var.argocd_oidc_client_secret,
    requested_scopes          = var.argocd_oidc_requested_scopes,
    requested_id_token_claims = var.argocd_oidc_requested_id_token_claims
  }
}



