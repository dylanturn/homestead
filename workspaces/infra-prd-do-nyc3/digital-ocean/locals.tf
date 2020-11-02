locals {
  instance_name = "${var.project_name}-${local.environment_map[lower(var.project_environment)]}-${var.project_region}"

  environment_map = {
    production = "prd"
    stage = "stg"
    development = "dev"
  }

  tags = concat([
    # This is where any common or generated project resource tags can go...
  ], var.tags)
}