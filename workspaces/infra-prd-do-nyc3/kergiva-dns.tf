#################
## Kergiva.app ##
#################
resource "digitalocean_domain" "kergiva_app" {
  name = "kergiva.app"
  ip_address = module.digital_ocean.cluster_load_balancer
}
resource "digitalocean_record" "kergiva_app_primary_record" {
  domain = digitalocean_domain.kergiva_app.name
  name   = "@"
  type   = "A"
  ttl    = 300
  value  = module.digital_ocean.cluster_load_balancer
}
resource "digitalocean_record" "kergiva_app_cluster_record" {
  domain = digitalocean_domain.kergiva_app.name
  name   = "*"
  type   = "A"
  ttl    = 300
  value  = module.digital_ocean.cluster_load_balancer
}

#################
## Kergiva.org ##
#################
resource "digitalocean_domain" "kergiva_org" {
  name = "kergiva.org"
  ip_address = module.digital_ocean.cluster_load_balancer
}
resource "digitalocean_record" "kergiva_org_primary_record" {
  domain = digitalocean_domain.kergiva_org.name
  name   = "@"
  type   = "A"
  ttl    = 300
  value  = module.digital_ocean.cluster_load_balancer
}
resource "digitalocean_record" "kergiva_org_cluster_record" {
  domain = digitalocean_domain.kergiva_org.name
  name   = "*"
  type   = "A"
  ttl    = 300
  value  = module.digital_ocean.cluster_load_balancer
}