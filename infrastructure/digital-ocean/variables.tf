variable "project_name" {
  type        = string
  description = "The name of the Project"
}
variable "project_description" {
  type        = string
  description = "the description of the project"
}
variable "project_purpose" {
  type        = string
  description = "The purpose of the project"
}
variable "project_environment" {
  type        = string
  description = "the environment of the project's resources. The possible values are: `Development`, `Staging`, `Production`)"
}
variable "project_region" {
  type = string
  description = "The region this projects resources will be created in."
}
variable "tags" {
  type    = list(string)
  default = []
}

variable "project_cluster_name" {
  type = string
}
variable "project_cluster_version" {
  type    = string
  default = null
}
variable "project_cluster_auto_upgrade" {
  type = bool
}
variable "project_cluster_surge_upgrade" {
  type = bool
}
variable "project_cluster_node_groups" {
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
variable "project_cluster_services" {
  type = object({
    # With any luck we'll be able to default `argocd` to null here. Until then we'll just have to do that in the calling module.
    argocd : object({
      namespace : string,
      server_replicas : number,
      repo_replicas : number,
      enable_dex : bool,
      enable_ha_redis : bool,
      oidc_name : string,
      oidc_issuer : string,
      oidc_client_id : string,
      oidc_client_secret : string,
      oidc_requested_scopes : list(string),
      oidc_requested_id_token_claims : map(any)
    })
  })
}
variable "project_cluster_tags" {
  type = list(string)
}