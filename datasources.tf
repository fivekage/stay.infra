locals {
  services = [
    "cloudresourcemanager.googleapis.com",
    "run.googleapis.com",
    "oslogin.googleapis.com",
    "compute.googleapis.com",
    "serviceusage.googleapis.com",
    "firebasehosting.googleapis.com",
    "firebase.googleapis.com",
    "appengine.googleapis.com",
    "iam.googleapis.com",
    "artifactregistry.googleapis.com"
  ]

  environment = var.env
  owner       = var.owner

  common_tags = {
    Environment = local.environment
    Owner       = local.owner
  }
}
