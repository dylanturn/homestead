#################
## Kergiva.app ##
#################
resource "digitalocean_domain" "kergiva_app" {
  name = "kergiva.app"
}
resource "digitalocean_record" "kergiva_app_cluster_record" {
  domain = digitalocean_domain.kergiva_app.name
  name   = "*"
  type   = "A"
  value  = module.digital_ocean.cluster_load_balancer
}

#################
## Kergiva.org ##
#################
resource "digitalocean_domain" "kergiva_org" {
  name = "kergiva.org"
}
resource "digitalocean_record" "kergiva_org_cluster_record" {
  domain = digitalocean_domain.kergiva_org.name
  name   = "*"
  type   = "A"
  value  = module.digital_ocean.cluster_load_balancer
}