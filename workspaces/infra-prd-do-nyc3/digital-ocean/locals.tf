locals {
  instance_name = "${var.project_name}-${local.environment_map[lower(var.project_environment)]}-${var.project_region}"

  environment_map = {
    prd         = "prd"
    prod        = "prd"
    production  = "prd"
    stg         = "stg"
    stage       = "stg"
    dev         = "dev"
    develop     = "dev"
    development = "dev"
  }

  tags = concat([
    # This is where any common or generated project resource tags can go...
  ], var.tags)
}