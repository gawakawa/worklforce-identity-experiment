# Grant IAP access to all principals from the Workforce Pool
resource "google_iap_web_backend_service_iam_member" "workforce" {
  web_backend_service = google_compute_backend_service.main.name
  role                = "roles/iap.httpsResourceAccessor"
  member              = "principalSet://iam.googleapis.com/${google_iam_workforce_pool.github.name}/*"
}
