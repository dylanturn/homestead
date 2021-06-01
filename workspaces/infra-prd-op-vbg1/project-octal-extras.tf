module "octal-extras" {
  source = "github.com/project-octal/terraform-kubernetes-octal-extras"

  argocd_namespace = module.argocd.namespace #module.kubernetes_cluster_services.argocd_namespace
  enabled_extras = {
    rookio = {
      enabled   = true
      namespace = "kube-rook"
    }
    kubedb = {
      enabled   = true
      namespace = "kube-kubedb"
      license   = base64decode(var.kubedb_base64_license)
    }
  }
}
