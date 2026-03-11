output "static_ip" {
  description = "Static IP address for DNS configuration"
  value       = google_compute_global_address.main.address
}

output "cloud_run_url" {
  description = "Cloud Run service URL (internal)"
  value       = google_cloud_run_v2_service.main.uri
}

output "service_url" {
  description = "Public service URL (via Load Balancer)"
  value       = "https://${var.domain}"
}

output "workforce_pool_id" {
  description = "Workforce Identity Pool ID"
  value       = google_iam_workforce_pool.github.workforce_pool_id
}

output "workforce_pool_name" {
  description = "Workforce Identity Pool full resource name"
  value       = google_iam_workforce_pool.github.name
}

output "workforce_provider_id" {
  description = "Workforce Identity Pool Provider ID"
  value       = google_iam_workforce_pool_provider.github_oidc.provider_id
}

output "workforce_audience" {
  description = "Audience for GitHub Actions OIDC token"
  value       = "//iam.googleapis.com/${google_iam_workforce_pool.github.name}/providers/${google_iam_workforce_pool_provider.github_oidc.provider_id}"
}
