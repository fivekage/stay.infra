# DATABASE
resource "google_firebase_web_app" "this" {
  provider     = google-beta
  project      = var.project_id
  display_name = "Stay"
}

data "google_firebase_web_app_config" "this" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.this.app_id
}

# STORE CONFIG INTO A BUCKET
resource "google_storage_bucket" "this" {
  provider = google-beta
  name     = local.bucket_name
  location = var.location
}

resource "google_storage_bucket_object" "this" {
  provider = google-beta
  bucket   = google_storage_bucket.this.name
  name     = "firebase-config.json"

  content = jsonencode({
    appId             = google_firebase_web_app.this.app_id
    apiKey            = data.google_firebase_web_app_config.this.api_key
    authDomain        = data.google_firebase_web_app_config.this.auth_domain
    databaseURL       = lookup(data.google_firebase_web_app_config.this, "database_url", "")
    storageBucket     = lookup(data.google_firebase_web_app_config.this, "storage_bucket", "")
    messagingSenderId = lookup(data.google_firebase_web_app_config.this, "messaging_sender_id", "")
    measurementId     = lookup(data.google_firebase_web_app_config.this, "measurement_id", "")
  })
}

# ENABLE FIRESTORE
resource "null_resource" "enable_firestore" {
  provisioner "local-exec" {
    command = "make firestore"
  }

}

resource "google_firestore_index" "trainings_user_time" {
  collection = "trainings"

  fields {
    field_path = "UserUuid"
    order      = "ASCENDING"
  }

  fields {
    field_path = "Time"
    order      = "ASCENDING"
  }

  fields {
    field_path = "__name__"
    order      = "ASCENDING"
  }

  depends_on = [null_resource.enable_firestore]
}
