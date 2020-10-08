data "terraform_remote_state" "infra" {
  backend = "remote"

  config = {
    organization = "turnbros"
    workspaces = {
      name = "homestead-infra-prd-do-nyc3"
    }
  }
}