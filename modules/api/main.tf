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

resource "google_app_engine_flexible_app_version" "this" {
  version_id = "v1"
  project    = google_app_engine_application.web_api.project
  service    = "default"
  runtime    = "custom" # Because using a Dockerfile

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    container {
      image = "gcr.io/${var.project_id}/${var.repository_id}-${var.env}"
    }
  }

  liveness_check {
    path = "/"
  }

  readiness_check {
    path = "/"
  }

  automatic_scaling {
    cool_down_period = "120s"
    cpu_utilization {
      target_utilization = 0.5
    }
  }
  env_variables = {
    port = "8080"
  }

  depends_on = [
    google_artifact_registry_repository.this
  ]
}


# Artifact Registry to store Docker images
resource "google_artifact_registry_repository" "this" {
  location      = var.location
  repository_id = var.repository_id
  description   = "Docker images for ${var.project_id}"
  format        = "DOCKER"
}
