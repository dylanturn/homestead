terraform {
  required_version = ">= 0.13"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    k8s = {
      source  = "banzaicloud/k8s"
      version = "0.8.0"
    }
  }
  backend "remote" {
    organization = "turnbros"
    workspaces {
      name = "homestead-infra-prd-op-vbg1"
    }
  }
}