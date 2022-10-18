resource "google_project" "stay" {
  name            = var.name
  project_id      = var.project_id
  billing_account = var.billing_account
  folder_id       = google_folder.stay.name
  skip_delete     = true
}

data "google_organization" "this" {
  domain = "5kage.xyz"
}

resource "google_folder" "stay" {
  display_name = "Stay Projects"
  parent       = data.google_organization.this.name
}
