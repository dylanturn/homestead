module "oidc_authentication" {
  source = "auth"

  path               = "oidc"
  oidc_discovery_url = "https://homestead.us.auth0.com/"
  oidc_client_id     = ""
  oidc_client_secret = ""
  bound_issuer       = "https://homestead.us.auth0.com/"
}

resource "vault_identity_group" "vault_pki_admins" {
  name     = "vault-admins"
  type     = "external"
  policies = [module.root_authority.admin_policy_name]
  metadata = {
    version = "1"
  }
}

resource "vault_identity_group_alias" "vault_admin_group_alias" {
  name           = "vault-admins"
  mount_accessor = module.oidc_authentication.auth_backend_accessor
  canonical_id   = vault_identity_group.vault_pki_admins.id
}
