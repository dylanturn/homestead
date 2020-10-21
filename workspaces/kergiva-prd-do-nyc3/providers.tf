variable "digital_ocean_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.digital_ocean_token
}
provider "kubernetes" {
  load_config_file       = false
  host                   = data.terraform_remote_state.infra.outputs.cluster_endpoint
  token                  = data.terraform_remote_state.infra.outputs.cluster_token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.cluster_ca_certificate)
}
provider "k8s" {
  load_config_file       = false
  host                   = data.terraform_remote_state.infra.outputs.cluster_endpoint
  token                  = data.terraform_remote_state.infra.outputs.cluster_token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.cluster_ca_certificate)
}