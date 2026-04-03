# Static IP
resource "google_compute_global_address" "main" {
  name = "iap-cloudrun-ip"

  depends_on = [google_project_service.apis]
}

# Serverless NEG
resource "google_compute_region_network_endpoint_group" "main" {
  name                  = "iap-cloudrun-neg"
  region                = var.region
  network_endpoint_type = "SERVERLESS"

  cloud_run {
    service = google_cloud_run_v2_service.main.name
  }
}

# Backend Service
resource "google_compute_backend_service" "main" {
  name = "iap-cloudrun-backend"

  protocol    = "HTTPS"
  timeout_sec = 30

  backend {
    group = google_compute_region_network_endpoint_group.main.id
  }

  iap {
    enabled = true
  }
}

# URL Map
resource "google_compute_url_map" "main" {
  name            = "iap-cloudrun-urlmap"
  default_service = google_compute_backend_service.main.id
}

# Managed SSL Certificate
resource "google_compute_managed_ssl_certificate" "main" {
  name = "iap-cloudrun-cert"

  managed {
    domains = [var.domain]
  }
}

# HTTPS Proxy
resource "google_compute_target_https_proxy" "main" {
  name             = "iap-cloudrun-https-proxy"
  url_map          = google_compute_url_map.main.id
  ssl_certificates = [google_compute_managed_ssl_certificate.main.id]
}

# Forwarding Rule
resource "google_compute_global_forwarding_rule" "main" {
  name                  = "iap-cloudrun-forwarding-rule"
  ip_address            = google_compute_global_address.main.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.main.id
  load_balancing_scheme = "EXTERNAL"
}
