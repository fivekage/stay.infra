locals {
  services = [
    "run.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "oslogin.googleapis.com",
    "compute.googleapis.com",

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