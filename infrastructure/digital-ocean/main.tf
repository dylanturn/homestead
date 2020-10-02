resource "digitalocean_project" "turnbros" {
  name        = "TurnBros"
  description = "A development environment that puts developers first."
  purpose     = "Operational / Developer tooling"
  environment = "Production"
}

module "kubernetes" {
  source              = "./kubernetes"
  auto_upgrade        = false
  cluster_node_groups = {}
  name                = ""
  parent_project_id   = ""
  region              = ""
  surge_upgrade       = false
  tags                = {}
  vpc_uuid            = ""
}