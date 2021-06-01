provider "kubernetes" {

  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  client_certificate     = base64decode(var.cluster_admin_client_certificate)
  client_key             = base64decode(var.cluster_admin_client_key)
}

provider "k8s" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  client_certificate     = base64decode(var.cluster_admin_client_certificate)
  client_key             = base64decode(var.cluster_admin_client_key)
}

provider "kubernetes-alpha" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  client_certificate     = base64decode(var.cluster_admin_client_certificate)
  client_key             = base64decode(var.cluster_admin_client_key)
}
