module "kubernetes_cluster" {
  source = "github.com/turnbros/terraform-digitalocean-kubernetes"

  parent_project_id   = digitalocean_project.project.id
  region              = var.project_region
  vpc_uuid            = digitalocean_vpc.project_vpc.id
  domain              = var.project_domain # == null ? null : digitalocean_domain.project_domain.0.name
  name                = var.project_cluster.name
  auto_upgrade        = var.project_cluster.auto_upgrade
  surge_upgrade       = var.project_cluster.surge_upgrade
  cluster_node_groups = var.project_cluster.cluster_node_groups
  k8s_version         = "1.18.8-do.1"
  tags                = concat(var.project_cluster.tags, local.tags)
}

module "kubernetes_cluster_services" {
  source                 = "github.com/turnbros/terraform-kubernetes-solutions-suite"
  cluster_endpoint       = module.kubernetes_cluster.cluster_endpoint
  cluster_token          = module.kubernetes_cluster.cluster_token
  cluster_ca_certificate = module.kubernetes_cluster.cluster_ca_certificate
  cert_manager           = var.project_cluster.cluster_services.cert_manager
  traefik                = var.project_cluster.cluster_services.traefik
  argocd                 = var.project_cluster.cluster_services.argocd
}

resource "digitalocean_record" "kubernetes_cluster_ingress_record" {
  count  = var.project_domain == null ? 0 : 1
  domain = var.project_domain
  name   = "*.${var.project_cluster.name}"
  type   = "A"
  value  = module.kubernetes_cluster_services.ingress_loadbalancer_ip_list[count.index]
}