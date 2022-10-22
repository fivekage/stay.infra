resource "google_app_engine_application" "web_api" {
  project        = var.project_id
  location_id    = var.region
  auth_domain    = var.auth_domain
  database_type  = var.database_type
  serving_status = var.serving_status
}

/*** TODO : Domain name ***/
/*
resource "google_app_engine_domain_mapping" "web_api_domain_mapping" {
  domain_name = "verified-domain.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
*/


# Artifact Registry to store Docker images
resource "google_artifact_registry_repository" "this" {
  location      = var.location
  repository_id = var.repository_id
  description   = "Docker images for ${var.project_id}"
  format        = "DOCKER"
}
