output "project_id" {
  description = "Active GCP project ID."
  value       = var.project_id
}

output "region" {
  description = "Active GCP region."
  value       = var.region
}

output "artifact_registry_repository" {
  description = "Fully qualified resource name of the backend Artifact Registry repository."
  value       = google_artifact_registry_repository.backend.name
}

output "artifact_registry_image_base" {
  description = "Base path used when tagging container images for push (e.g. docker tag <image> <base>/<name>:<tag>)."
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.backend.repository_id}"
}
