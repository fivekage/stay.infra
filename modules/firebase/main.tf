# DATABASE
resource "google_firebase_project" "firebase_database" {
  provider = google-beta
  project  = var.project_id
}