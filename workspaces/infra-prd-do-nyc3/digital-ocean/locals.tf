locals {
  tags = concat([
    # This is where any common or generated project resource tags can go...
  ], var.tags)
}