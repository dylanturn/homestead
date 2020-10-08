resource "kubernetes_namespace" "rational_healthcare" {
  metadata {
    name = "${var.namespace}-${var.environment}"
  }
}

resource "kubernetes_secret" "secret" {
  metadata {
    name      = "regcred"
    namespace = kubernetes_namespace.rational_healthcare.metadata.0.name
  }
  data = {
    ".dockerconfigjson" : base64decode(var.image_pull_secret)
  }
  type = "kubernetes.io/dockerconfigjson"
}

module "project" {
  source = "github.com/turnbros/terraform-argocd-project"

  argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace
  name             = local.project_name
  description      = local.project_description
  destinations = [
    {
      server    = "https://kubernetes.default.svc"
      namespace = kubernetes_namespace.rational_healthcare.metadata.0.name
    }
  ]
}

module "kergiva_web" {
  source = "github.com/rationalhealthcare/terraform-argo-kergiva-web"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_web_domain_name
  image_repo        = var.kergiva_web_image_repo
  image_name        = var.kergiva_web_image_name
  image_tag         = var.kergiva_web_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
}

module "kergiva_api" {
  source = "github.com/rationalhealthcare/terraform-argo-kergiva-api"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_api_domain_name
  image_repo        = var.kergiva_api_image_repo
  image_name        = var.kergiva_api_image_name
  image_tag         = var.kergiva_api_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
}

module "kergiva_app" {
  source = "github.com/rationalhealthcare/terraform-argo-kergiva-app"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_app_domain_name
  image_repo        = var.kergiva_app_image_repo
  image_name        = var.kergiva_app_image_name
  image_tag         = var.kergiva_app_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
}
