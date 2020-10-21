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