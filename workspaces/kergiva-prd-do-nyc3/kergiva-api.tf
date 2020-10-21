module "kergiva_api" {
  source = "github.com/rationalhealthcare/terraform-argo-kergiva-api?ref=main"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_api_domain_name
  chart_version     = "0.1.7"
  image_repo        = var.kergiva_api_image_repo
  image_name        = var.kergiva_api_image_name
  image_tag         = var.kergiva_api_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
  database_host      = digitalocean_database_cluster.kergiva_db_cluster.private_host
  database_port     = digitalocean_database_cluster.kergiva_db_cluster.port
  database_username = digitalocean_database_cluster.kergiva_db_cluster.user
  database_password = digitalocean_database_cluster.kergiva_db_cluster.password
  database_name     = digitalocean_database_db.kergiva_db_cluster_database.name
}