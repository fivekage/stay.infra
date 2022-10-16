# Enables the Cloud Run API
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}

# Create the Cloud Run service
resource "google_cloud_run_service" "web_front" {
  name     = var.name
  location = var.location

  template {
    spec {
      containers {
        image = var.image_url
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  
  depends_on = [google_project_service.run_api]
}

