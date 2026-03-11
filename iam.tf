# Service Account for IAP access (programmatic access requires SA impersonation)
resource "google_service_account" "iap_accessor" {
  account_id   = "iap-accessor"
  display_name = "IAP Accessor Service Account"
}

# Grant IAP access to the Service Account
resource "google_iap_web_backend_service_iam_member" "service_account" {
  web_backend_service = google_compute_backend_service.main.name
  role                = "roles/iap.httpsResourceAccessor"
  member              = "serviceAccount:${google_service_account.iap_accessor.email}"
}

# Allow Workforce Pool principals to generate ID tokens for the Service Account
resource "google_service_account_iam_member" "workforce_token_creator" {
  service_account_id = google_service_account.iap_accessor.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "principalSet://iam.googleapis.com/${google_iam_workforce_pool.github.name}/*"
}
