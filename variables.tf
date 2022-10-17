variable "env" {
  description = "The environment to deploy to"
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

variable "image_url" {
  description = "URL image application"
  type        = string
}
