module "argocd" {
    source = "git::ssh:://git@github.com/dylanturn/terraform-kubernetes-argocd.git?ref=master"
}