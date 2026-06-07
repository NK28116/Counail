variable "project_id" {
  description = "GCP project ID where Counail infrastructure is provisioned."
  type        = string
}

variable "region" {
  description = "GCP region used as the default location for regional resources (e.g. Cloud Run, Artifact Registry)."
  type        = string
  default     = "asia-northeast1"
}

variable "environment" {
  description = "Deployment environment identifier (e.g. dev, staging, prod). Used for labelling."
  type        = string
  default     = "dev"
}

variable "artifact_registry_repository_id" {
  description = "Repository ID for the Artifact Registry that stores backend container images."
  type        = string
  default     = "counail-backend"
}

variable "enabled_services" {
  description = "List of Google Cloud APIs to enable for the project."
  type        = list(string)
  default = [
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "secretmanager.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
  ]
}
