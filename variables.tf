variable "env" {
  description = "The environment to deploy to"
  type        = string
}

variable "owner" {
  description = "Owner of the resource"
  type        = string
  default     = ""
}


variable "project_name" {
  description = "Project name"
  type        = string
}

variable "billing_account" {
  description = "Billing Account"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "location" {
  description = "Location to serve the app from"
  type        = string
  default     = "europe-west1"
}
variable "region" {
  description = "Location where region store bucket"
  type        = string
  default     = "europe-west"
  validation {
    condition     = var.region == null || var.region == "us-central" || var.region == "europe-west"
    error_message = "Value must be us-central or europe-west."
  }
}

variable "GOOGLE_CREDENTIALS" {
  description = "GCP credentials used for authentication"
  default     = ""
  type        = string
}

variable "service_account_id" {
  description = "Stay Service Account"
  type        = string
}

variable "role" {
  description = "Role"
  type        = string
  default     = "roles/owner"
}

variable "repository_id" {
  description = "Artifact Repository ID"
  type        = string
}
