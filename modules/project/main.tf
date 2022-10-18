resource "google_project" "stay" {
  name            = var.name
  project_id      = var.project_id
  billing_account = var.billing_account
  skip_delete     = true
}
