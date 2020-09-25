#module "argocd" {
#    source = "git::github.com/dylanturn/terraform-kubernetes-argocd.git?ref=master"
#    namespace = "argocd-test"
#}


module "argocd" {
  source  = "app.terraform.io/turnbros/argocd/kubernetes"
  version = "0.0.1"
  namespace = "argocd-test"
}

