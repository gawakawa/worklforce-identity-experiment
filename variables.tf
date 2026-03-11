variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for Cloud Run"
  type        = string
  default     = "asia-northeast1"
}

variable "organization_id" {
  description = "GCP Organization ID (required for Workforce Identity Pool)"
  type        = string
}

variable "domain" {
  description = "Domain name for the Cloud Run service (e.g., example.com)"
  type        = string
}

variable "github_organization" {
  description = "GitHub organization name for attribute condition"
  type        = string
}
