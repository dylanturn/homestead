module "argocd" {
    source = "git::github.com/dylanturn/terraform-kubernetes-argocd.git?ref=master"
    namespace = "argocd-test"
}
