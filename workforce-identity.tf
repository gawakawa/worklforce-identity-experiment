# Workforce Identity Pool
resource "google_iam_workforce_pool" "github" {
  provider          = google-beta
  workforce_pool_id = "workforce-identity-experiment-iota"
  parent            = "organizations/${var.organization_id}"
  location          = "global"
  session_duration  = "3600s"
  display_name      = "GitHub Actions Pool"
  description       = "Workforce Identity Pool for GitHub Actions OIDC"

  depends_on = [google_project_service.apis]
}

# Workforce Identity Pool Provider
resource "google_iam_workforce_pool_provider" "github_oidc" {
  provider          = google-beta
  workforce_pool_id = google_iam_workforce_pool.github.workforce_pool_id
  location          = google_iam_workforce_pool.github.location
  provider_id       = "github-oidc"
  display_name      = "GitHub OIDC Provider"
  description       = "OIDC Provider for GitHub Actions"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }

  attribute_condition = "assertion.repository_owner == \"${var.github_organization}\""

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
    client_id  = "//iam.googleapis.com/${google_iam_workforce_pool.github.name}/providers/github-oidc"
    web_sso_config {
      response_type             = "ID_TOKEN"
      assertion_claims_behavior = "ONLY_ID_TOKEN_CLAIMS"
    }
  }
}
