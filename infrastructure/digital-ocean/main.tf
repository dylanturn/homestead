resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = var.project_environment
}

resource "digitalocean_vpc" "vpc" {
  name     = "${var.project_name}-vpc-network"
  region   = var.project_region
}

module "kubernetes" {
  source   = "./kubernetes"
  count = length(var.project_clusters)

  parent_project_id   = digitalocean_project.project.id
  region              = var.project_region
  vpc_uuid            = digitalocean_vpc.vpc.id
  name                = var.project_clusters[count.index].name
  auto_upgrade        = var.project_clusters[count.index].auto_upgrade
  surge_upgrade       = var.project_clusters[count.index].surge_upgrade
  cluster_node_groups = var.project_clusters[count.index].cluster_node_groups
  cluster_services    = var.project_clusters[count.index].cluster_services
  tags                = merge(var.project_clusters[count.index].tags, local.tags)
}