output "email" {
  description = "Email of the service acccount"
  value       = google_service_account.service_account.email
}
