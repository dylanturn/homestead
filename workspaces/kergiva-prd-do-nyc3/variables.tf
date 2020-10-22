variable "environment" {
  type = string
}
variable "namespace" {
  type = string
}
variable "terraform_cloud_token" {
  type = string
}
variable "image_pull_secret" {
  type = string
}

# Kergiva Web

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

# Kergiva API

variable "kergiva_api_domain_name" {
  type    = string
  default = "api.kergiva.brava.turnbros.app"
}
variable "kergiva_api_image_repo" {
  type    = string
  default = "docker.pkg.github.com"
}
variable "kergiva_api_image_name" {
  type    = string
  default = "rationalhealthcare/myapi/kergiva-api"
}
variable "kergiva_api_image_tag" {
  type    = string
  default = "latest"
}

# Kergiva APP

variable "kergiva_app_domain_name" {
  type    = string
  default = "app.kergiva.brava.turnbros.app"
}
variable "kergiva_app_image_repo" {
  type    = string
  default = "docker.pkg.github.com"
}
variable "kergiva_app_image_name" {
  type    = string
  default = "rationalhealthcare/vuetify2/appdash"
}
variable "kergiva_app_image_tag" {
  type    = string
  default = "runtime_var_branch"
}