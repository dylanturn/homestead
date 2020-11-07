#resource "digitalocean_project" "project" {
#  name        = var.project_name
#  description = var.project_description
#  purpose     = var.project_purpose
#  environment = var.project_environment
#}

data "digitalocean_project" "project" {
  name = var.project_name
}

resource "digitalocean_vpc" "project_vpc" {
  name   = "${var.project_name}-vpc-network"
  region = var.project_region
}

resource "digitalocean_domain" "project_domain" {
  name = var.project_domain
}