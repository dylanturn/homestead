terraform {
  required_version = ">= 0.13"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "turnbros"
    workspaces {
      name = "homestead-infra-prd-do-nyc3"
    }
  }
}