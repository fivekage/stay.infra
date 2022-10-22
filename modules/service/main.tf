resource "google_project_service" "this" {
  project = var.project_id
  service = var.service_id
}
