locals {
  project_name        = "kergiva"
  project_description = "ArgoCD project for Kergiva"

  kergiva_db_cluster_name           = "kergiva-db"
  kergiva_db_name                   = "profile"
  kergiva_db_cluster_engine_version = "8"
  kergiva_db_cluster_instance_type  = "db-s-1vcpu-1gb"
  kergiva_db_cluster_instance_count = 1
}