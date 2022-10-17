resource "google_project" "stay" {
  name            = "Stay"
  project_id      = "stay-365814"
  folder_id       = google_folder.stay.name
  billing_account = "012636-EE4503-979BC9"
  skip_delete     = true
}

resource "google_folder" "stay" {
  display_name = "Stay Projects"
  parent       = "organizations/1234567"
}
