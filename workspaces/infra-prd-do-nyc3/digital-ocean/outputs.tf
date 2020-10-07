output "cluster_endpoint" {
  value = module.kubernetes_cluster.cluster_endpoint
}
output "cluster_ca_certificate" {
  value = module.kubernetes_cluster.cluster_ca_certificate
}
output "cluster_token" {
  value     = module.kubernetes_cluster.cluster_token
  sensitive = true
}
output "cluster_cert_issuer" {
  value = var.cert_manager == null ? "" : module.cert_manager[0].cert_issuer
}
output "cluster_ingress_class" {
  value = var.traefik == null ? "" : module.traefik[0].ingress_class
}
output "cluster_argocd_namespace" {
  value = module.kubernetes_cluster_services.argocd_namespace
}