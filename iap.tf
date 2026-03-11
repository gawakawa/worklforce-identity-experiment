# IAP Brand (OAuth consent screen)
resource "google_iap_brand" "main" {
  support_email     = data.google_client_openid_userinfo.me.email
  application_title = "IAP Protected Cloud Run"

  depends_on = [google_project_service.apis]
}

data "google_client_openid_userinfo" "me" {}

# IAP OAuth Client
resource "google_iap_client" "main" {
  display_name = "IAP Client"
  brand        = google_iap_brand.main.name
}
