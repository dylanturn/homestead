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