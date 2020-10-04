# Homestead
A repository that contains the code used to deploy and manage infrastructure and code deployment pipelines

### Infrastructure
`./infrastructure`
Defines and manages the infrastructure used by the pipelines.

### Pipelines
`./pipelines`
Defines and manages the pipelines used to deploy and manage code.

## Getting Started
### Minimum Configuration Required
```hcl-terraform
module "digital_ocean" {
source = "../infrastructure/digital-ocean"

  project_name        = "TurnBros"
  project_description = "A development environment that puts developers first."
  project_environment = "Production"
  project_purpose     = "Operational / Developer tooling"
  project_region      = "nyc3"
  project_clusters    = {}
}
```
### Deploy Kubernetes cluster in a Digital Ocean Project
```hcl-terraform
module "digital_ocean" {
  source = "../infrastructure/digital-ocean"

  project_name        = "TurnBros"
  project_description = "A development environment that puts developers first."
  project_environment = "Production"
  project_purpose     = "Operational / Developer tooling"
  project_region      = "nyc3"
  project_clusters = {
      name          = "cattle-farm",
      auto_upgrade  = false,
      surge_upgrade = false,
      cluster_node_groups = {
        "brava" = {
          size       = "s-1vcpu-2gb",
          node_count = 4,
          auto_scale = false,
          min_nodes  = null,
          max_nodes  = null,
          labels     = {},
          tags       = [],
        }
      },
      cluster_services = {
        argocd = {
          namespace                      = "kube-argocd",
          server_replicas                = 1,
          repo_replicas                  = 1,
          enable_dex                     = false,
          enable_ha_redis                = false,
          oidc_name                      = var.argocd_oidc_name,
          oidc_issuer                    = var.argocd_oidc_issuer,
          oidc_client_id                 = var.argocd_oidc_client_id,
          oidc_client_secret             = var.argocd_oidc_client_secret,
          oidc_requested_scopes          = var.argocd_oidc_requested_scopes,
          oidc_requested_id_token_claims = var.argocd_oidc_requested_id_token_claims
        }
      },
      tags = []
  }
}
```