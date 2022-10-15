resource "google_cloud_run_service" "default" {
  name     = var.name
  location = var.location

  traffic {
    percent         = 100
    latest_revision = true
  }
}