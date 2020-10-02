data "digitalocean_project" "parent_project" {
  id = var.parent_project_id
}

resource "digitalocean_project_resources" "project_resource" {
  project   = data.digitalocean_project.parent_project.id
  resources = []
}