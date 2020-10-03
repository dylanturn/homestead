data "digitalocean_kubernetes_versions" "eligible_versions" {
  version_prefix = var.k8s_version
}

resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name          = var.name
  region        = var.region
  version       = var.k8s_version == null ? data.digitalocean_kubernetes_versions.eligible_versions.latest_version : data.digitalocean_kubernetes_versions.eligible_versions.latest_version
  vpc_uuid      = var.vpc_uuid
  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade

  dynamic "node_pool" {
    for_each = var.cluster_node_groups
    content {
      name       = node_pool.key
      size       = node_pool.value.size
      node_count = node_pool.value.node_count
      auto_scale = node_pool.value.auto_scale
      min_nodes  = node_pool.value.min_nodes
      max_nodes  = node_pool.value.max_nodes
      labels     = merge(node_pool.value.labels, local.default_node_labels)
      tags       = merge(node_pool.value.tags, local.default_cluster_tags)
    }
  }

  tags = concat(var.tags, local.default_cluster_tags)
}

resource "digitalocean_project_resources" "project_resource" {
  project = var.parent_project_id
  resources = [
    for node_id in digitalocean_kubernetes_cluster.kubernetes_cluster.node_pool[*].nodes[*].id :
    "do:droplet:${node_id}"
  ]
}

module "kubernetes_cluster_services" {
  source = "../../kubernetes-services"
  argocd = var.cluster_services.argocd
}