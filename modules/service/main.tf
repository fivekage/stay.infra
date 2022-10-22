resource "google_project_service" "this" {
  project = var.project_id
  service = var.service_id

  disable_dependent_services = true
}
