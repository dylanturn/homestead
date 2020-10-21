resource "digitalocean_database_cluster" "kergiva_db_cluster" {
  name                 = local.kergiva_db_cluster_name
  engine               = "mysql"
  version              = local.kergiva_db_cluster_engine_version
  size                 = local.kergiva_db_cluster_instance_type
  region               = data.terraform_remote_state.infra.outputs.region
  private_network_uuid = data.terraform_remote_state.infra.outputs.private_vpc_id
  node_count           = local.kergiva_db_cluster_instance_count
}

resource "digitalocean_database_db" "kergiva_db_cluster_database" {
  cluster_id = digitalocean_database_cluster.kergiva_db_cluster.id
  name       = local.kergiva_db_name
}