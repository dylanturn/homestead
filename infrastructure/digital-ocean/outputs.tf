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