
resource "digitalocean_project_resources" "kubernetes_loadbalancer_resource" {
  project = var.parent_project_id
  resources = [
    digitalocean_loadbalancer.kubernetes_loadbalancer.urn
  ]
}

resource "digitalocean_loadbalancer" "kubernetes_loadbalancer" {
  name   = "${var.name}-loadbalancer"
  region = var.region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.web.id]
}