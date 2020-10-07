variable "project_name" {
  type        = string
  description = "The name of the Project"
}
variable "project_domain" {
  type        = string
  description = "A domain name to associate with this project"
  default     = null
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
  type        = string
  description = "The region this projects resources will be created in."
}

# I'm doing this in the hopes that someday soon we'll be able to assign defaults to attributes.
# This was meant to be a list of clusters. The idea was that you could define one or more clusters and Terraform would just handle it for you
# Unfortunately since we don't know the Kubernetes provider information until after we've deployed the cluster.
# See here for more information: https://github.com/hashicorp/terraform/issues/25120
variable "project_cluster" {
  type = object({
    name : string,
    auto_upgrade : bool,
    surge_upgrade : bool,
    cluster_node_groups : list(object({
      size : string,
      node_count : number,
      auto_scale : bool,
      min_nodes : number,
      max_nodes : number,
      tags : list(string),
      labels : map(string),
    }))
    cluster_services : object({
      cert_manager : object({
        certificate_issuers = object({
          letsencrypt = object({
            name: string,
            server: string,
            email: string,
            secret_base64_key: string,
            default_issuer: bool
          })
        })
      })
      traefik : object({
        namespace : string,
        log_level : string,
        replicas : number,
        rolling_update_max_surge : number,
        rolling_update_max_unavailable : number,
        pod_termination_grace_period_seconds : number
      })
      # With any luck we'll be able to default `argocd` to null here. Until then we'll just have to do that in the calling module.
      argocd : object({
        url : string,
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
    tags = list(string)
  })
  description = "A list of kubernetes clusters to provision in this Digital Ocean project."
  default     = null
}

variable "tags" {
  type    = list(string)
  default = []
}