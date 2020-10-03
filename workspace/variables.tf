variable "argocd_oidc_name" {
  type = string
}
variable "argocd_oidc_issuer" {
  type = string
}
variable "argocd_oidc_client_id" {
  type = string
}
variable "argocd_oidc_client_secret" {
  type = string
}
variable "argocd_oidc_requested_scopes" {
  type = list(string)
}
variable "argocd_oidc_requested_id_token_claims" {
  type = map(any)
}