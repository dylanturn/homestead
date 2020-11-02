resource "digitalocean_database_cluster" "database_cluster" {
  name                 = "${local.instance_name}-shared-db"
  engine               = var.db_cluster_engine
  version              = var.db_cluster_engine_version
  size                 = var.db_cluster_instance_type
  private_network_uuid = digitalocean_vpc.project_vpc.id
  region               = digitalocean_vpc.project_vpc.region
  node_count           = var.db_cluster_instance_count
}