module "kergiva" {
  source = "github.com/rationalhealthcare/terraform-octal-kergiva?ref=stage"

  environment = ""
  digital_ocean_token = ""
  image_pull_secret = ""

  ###################################
  ### Infrastructure Remote State ###
  ###################################
  remote_state_token = ""
  remote_state_organization = ""
  remote_state_workspace = ""

  ###################
  ### Kergiva Web ###
  ###################
  kergiva_web_domain_name = ""
  kergiva_web_image_name = ""
  kergiva_web_image_repo = ""
  kergiva_web_image_tag = ""
  kergiva_web_chart_version = ""

  ###################
  ### Kergiva APP ###
  ###################
  kergiva_app_domain_name = ""
  kergiva_app_image_name = ""
  kergiva_app_image_repo = ""
  kergiva_app_image_tag = ""
  kergiva_app_chart_version = ""

  ###################
  ### Kergiva API ###
  ###################
  kergiva_api_domain_name = ""
  kergiva_api_image_name = ""
  kergiva_api_image_repo = ""
  kergiva_api_image_tag = ""
  kergiva_api_chart_version = ""
}