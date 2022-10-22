resource "google_project_service" "this" {
  project = var.project_id
  service = var.service_id

  disable_dependent_services = true
  disable_on_destroy         = false
  provisioner "local-exec" {
    command = <<EOF
for i in {1..5}; do
  sleep $i
  if gcloud services list --project="${var.project_id}" | grep "${var.service_id}"; then
    exit 0
  fi
done

echo "Service was not enabled after 15s"
exit 1
EOF
  }
}
