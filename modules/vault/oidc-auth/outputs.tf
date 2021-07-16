output "auth_backend_accessor" {
  value = vault_jwt_auth_backend.oidc_auth_backend.accessor
}
