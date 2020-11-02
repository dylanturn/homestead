resource "digitalocean_database_cluster" "kergiva_db_cluster" {
  name                 = local.kergiva_db_cluster_name
  engine               = local.kergiva_db_cluster_engine
  version              = local.kergiva_db_cluster_engine_version
  size                 = local.kergiva_db_cluster_instance_type
  region               = data.terraform_remote_state.infra.outputs.region
  private_network_uuid = data.terraform_remote_state.infra.outputs.private_vpc_id
  node_count           = local.kergiva_db_cluster_instance_count
}