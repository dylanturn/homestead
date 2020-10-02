variable "parent_project_id" {
  type = string
}
variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "k8s_version" {
  type    = string
  default = null
}
variable "vpc_uuid" {
  type = string
}
variable "auto_upgrade" {
  type = bool
}
variable "surge_upgrade" {
  type = bool
}
variable "cluster_node_groups" {
  type = map(object({
    size : string,
    node_count : number,
    auto_scale : bool,
    min_nodes : number,
    max_nodes : number,
    tags : list(string),
    labels : map(string),
  }))
}
variable "tags" {
  type = map(string)
}