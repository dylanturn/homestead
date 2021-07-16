locals {
  default_role_name = "user"
}

resource "vault_jwt_auth_backend" "oidc_auth_backend" {
  description        = "Terraform JWT auth backend"
  path               = var.path
  type               = "oidc"
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  bound_issuer       = var.bound_issuer
  default_role       = local.default_role_name

  tune {
    listing_visibility = var.listing_visibility
    default_lease_ttl  = var.default_lease_ttl
    max_lease_ttl      = var.max_lease_ttl
    token_type         = var.token_type
  }
}

resource "vault_jwt_auth_backend_role" "oidc_auth_default_user_role" {
  backend   = vault_jwt_auth_backend.oidc_auth_backend.path
  role_name = local.default_role_name

  bound_audiences = [var.oidc_client_id]
  user_claim      = "sub"
  role_type       = "oidc"
  groups_claim    = "https://vault.seismic.com/claims/groups"
  token_policies  = ["default"]

  allowed_redirect_uris = [
    ""
  ]
}
