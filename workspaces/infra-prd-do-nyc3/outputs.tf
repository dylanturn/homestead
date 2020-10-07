output "cluster_endpoint" {
  value = module.digital_ocean.cluster_endpoint
}
output "cluster_ca_certificate" {
  value = module.digital_ocean.cluster_ca_certificate
}
output "cluster_token" {
  value     = module.digital_ocean.cluster_token
  sensitive = true
}
output "cluster_cert_issuer" {
  value = module.digital_ocean.cluster_cert_issuer
}
output "cluster_ingress_class" {
  value = module.digital_ocean.cluster_ingress_class
}
output "cluster_argocd_namespace" {
  value = module.digital_ocean.cluster_argocd_namespace
}