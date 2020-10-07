resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = var.project_environment
}

resource "digitalocean_vpc" "project_vpc" {
  name   = "${var.project_name}-vpc-network"
  region = var.project_region
}

# TODO: The kubernetes record should be referencing an output of this resource
#resource "digitalocean_domain" "project_domain" {
#  count = var.project_domain == null ? 0 : 1
#  name  = var.project_domain
#}