module "kergiva_api" {
  source = "github.com/rationalhealthcare/terraform-argo-kergiva-api?ref=main"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_api_domain_name
  chart_version     = "0.1.11"
  image_repo        = var.kergiva_api_image_repo
  image_name        = var.kergiva_api_image_name
  image_tag         = var.kergiva_api_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
  database_host     = data.terraform_remote_state.kergiva_db.outputs.host
  database_port     = data.terraform_remote_state.kergiva_db.outputs.port
  database_username = data.terraform_remote_state.kergiva_db.outputs.username
  database_password = data.terraform_remote_state.kergiva_db.outputs.password
}