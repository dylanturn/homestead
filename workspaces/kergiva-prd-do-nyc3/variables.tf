variable "environment" {
  type = string
}
variable "namespace" {
  type = string
}
variable "kergiva_web_domain_name" {
  type    = string
  default = "web.kergiva.brava.turnbros.app"
}
variable "kergiva_web_image_repo" {
  type    = string
  default = "docker.pkg.github.com"
}
variable "kergiva_web_image_name" {
  type    = string
  default = "rationalhealthcare/kgweb/kgweb"
}
variable "kergiva_web_image_tag" {
  type    = string
  default = "latest"
}
variable "image_pull_secret" {
  type = string
}
variable "terraform_cloud_token" {
  type = string
}