data "terraform_remote_state" "infra" {
  backend = "remote"

  config = {

    organization = "turnbros"
    token = var.terraform_cloud_token
    workspaces = {
      name = "homestead-infra-prd-do-nyc3"
    }
  }
}