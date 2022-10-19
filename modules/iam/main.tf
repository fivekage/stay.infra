resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = "Stay Service Account"
  description  = "Stay Service Account used for project ${var.project_id}"
  disabled     = false
  project      = var.project_id
}

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = var.role
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

# Allow SA service account use the default GCE account
resource "google_service_account_iam_member" "gce-default-account-iam" {
  service_account_id = data.google_compute_default_service_account.default.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.service_account.email}"
}
