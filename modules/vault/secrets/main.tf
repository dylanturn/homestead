resource "vault_mount" "secrets_mount" {
  path        = "secrets"
  type        = "kv-v2"
  description = "This is the KV Version 2 secret engine mount"
}