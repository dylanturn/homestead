output "region" {
  value = var.region
}
output "private_vpc_id" {
  value = module.digital_ocean.private_vpc_id
}

output "database_remote_host" {
  value = module.digital_ocean.database_remote_host
}
output "database_host" {
  value = module.digital_ocean.database_host
}
output "database_port" {
  value = module.digital_ocean.database_port
}
output "database_username" {
  value = module.digital_ocean.database_username
}
output "database_password" {
  value = module.digital_ocean.database_password
}

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
output "cluster_load_balancer" {
  value = module.digital_ocean.cluster_load_balancer
}