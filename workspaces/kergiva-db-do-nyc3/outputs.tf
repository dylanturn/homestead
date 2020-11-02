output "host" {
  value = digitalocean_database_cluster.kergiva_db_cluster.private_host
}
output "port" {
  value = digitalocean_database_cluster.kergiva_db_cluster.port
}
output "username" {
  value = digitalocean_database_cluster.kergiva_db_cluster.user
}
output "password" {
  value = digitalocean_database_cluster.kergiva_db_cluster.password
}