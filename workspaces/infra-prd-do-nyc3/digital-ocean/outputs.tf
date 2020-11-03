output "private_vpc_id" {
  value = digitalocean_vpc.project_vpc.id
}
output "private_vpc_region" {
  value = digitalocean_vpc.project_vpc.region
}

output "database_remote_host" {
  value = digitalocean_database_cluster.database_cluster.host
}
output "database_host" {
  value = digitalocean_database_cluster.database_cluster.private_host
}
output "database_port" {
  value = digitalocean_database_cluster.database_cluster.port
}
output "database_username" {
  value = digitalocean_database_cluster.database_cluster.user
}
output "database_password" {
  value = digitalocean_database_cluster.database_cluster.password
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
  value = module.kubernetes_cluster_services["argocd_namespace"]
}
output "cluster_load_balancer" {
  count  = var.project_domain == null ? 0 : 1
  value = module.kubernetes_cluster_services.ingress_loadbalancer_ip_list[count.index]
}