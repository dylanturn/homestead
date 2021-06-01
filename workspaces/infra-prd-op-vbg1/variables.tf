variable "cluster_endpoint" {
  type = string
}
variable "cluster_admin_client_key" {
  type    = string
  default = null
}
variable "cluster_admin_client_certificate" {
  type    = string
  default = null
}
variable "cluster_ca_certificate" {
  type = string
}
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
variable "letsencrypt_secret_base64_key" {
  type = string
}
variable "kubedb_base64_license" {
  type = string
}