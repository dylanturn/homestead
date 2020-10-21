output "private_vpc_id" {
  value = digitalocean_vpc.project_vpc.id
}
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
  value = module.kubernetes_cluster_services.cluster_cert_issuer
}
output "cluster_ingress_class" {
  value = module.kubernetes_cluster_services.cluster_ingress_class
}
output "cluster_argocd_namespace" {
  value = module.kubernetes_cluster_services.argocd_namespace
}