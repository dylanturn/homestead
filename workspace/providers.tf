variable "digital_ocean_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.digital_ocean_token
}