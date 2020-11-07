module "kubernetes_cluster" {
  source = "github.com/turnbros/terraform-digitalocean-kubernetes"

  parent_project_id   = data.digitalocean_project.project.id
  region              = var.project_region
  vpc_uuid            = digitalocean_vpc.project_vpc.id
  domain              = digitalocean_domain.project_domain.name
  name                = var.project_cluster.name
  auto_upgrade        = var.project_cluster.auto_upgrade
  surge_upgrade       = var.project_cluster.surge_upgrade
  cluster_node_groups = var.project_cluster.cluster_node_groups
  k8s_version         = "1.19.3-do.2"
  tags                = concat(var.project_cluster.tags, local.tags)
}

module "kubernetes_cluster_services" {
  source                 = "github.com/project-octal/terraform-kubernetes-octal"
  cluster_endpoint       = module.kubernetes_cluster.cluster_endpoint
  cluster_token          = module.kubernetes_cluster.cluster_token
  cluster_ca_certificate = module.kubernetes_cluster.cluster_ca_certificate
  cert_manager           = var.project_cluster.cluster_services.cert_manager
  traefik                = var.project_cluster.cluster_services.traefik
  argocd                 = var.project_cluster.cluster_services.argocd
}

resource "digitalocean_record" "kubernetes_cluster_ingress_record" {
  domain = digitalocean_domain.project_domain.name
  name   = "*.${var.project_cluster.name}"
  type   = "A"
  value  = module.kubernetes_cluster_services.ingress_loadbalancer_ip_list[0]
}