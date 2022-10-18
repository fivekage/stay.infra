terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.7.0"
    }
  }
  cloud {
    organization = "samymokhtari"

    workspaces {
      name = "5kage-workspace"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.location
  credentials = var.GOOGLE_CREDENTIALS
  zone        = var.region
}

provider "google-beta" {
  project     = var.project_id
  region      = var.location
  credentials = var.GOOGLE_CREDENTIALS
  zone        = var.region
}
