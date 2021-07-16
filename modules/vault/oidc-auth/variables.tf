variable "path" {
  type        = string
  description = "Path to mount the JWT/OIDC auth backend"
}

variable "oidc_discovery_url" {
  type        = string
  description = "The OIDC Discovery URL, without any .well-known component (base path)"
}

variable "oidc_client_id" {
  type        = string
  description = "Client ID used for OIDC backends"
}

# TODO: The oidc_client_secret should be stored in Vault.
# Maybe all the config could be stored in vault? Something to think about.
variable "oidc_client_secret" {
  type        = string
  description = "Client Secret used for OIDC backends"
}

variable "bound_issuer" {
  type        = string
  description = "The value against which to match the iss claim in a JWT"
  default     = null
}

variable "listing_visibility" {
  type        = string
  description = "Specifies whether to show this mount in the UI-specific listing endpoint. Valid values are `unauth` or `hidden`."
  default     = "unauth"
}

variable "default_oidc_role" {
  type        = string
  description = "The name of the default OIDC role"
  default     = "user"
}

variable "default_lease_ttl" {
  type        = string
  description = "Specifies the default time-to-live. If set, this overrides the global default. Must be a valid duration string"
  default     = "1h"
}

variable "max_lease_ttl" {
  type        = string
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  default     = "768h"
}

variable "token_type" {
  type        = string
  description = "Specifies the type of tokens that should be returned by the mount. Valid values are `default-service`, `default-batch`, `service`, `batch`."
  default     = "default-service"
}