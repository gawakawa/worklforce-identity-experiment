# Terraform Module

## Overview

This module provides...

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.50.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 6.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_iam_workforce_pool.github](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_iam_workforce_pool) | resource |
| [google-beta_google_iam_workforce_pool_provider.github_oidc](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_iam_workforce_pool_provider) | resource |
| [google_cloud_run_v2_service.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service) | resource |
| [google_compute_backend_service.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_global_address.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_managed_ssl_certificate.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_managed_ssl_certificate) | resource |
| [google_compute_region_network_endpoint_group.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint_group) | resource |
| [google_compute_target_https_proxy.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) | resource |
| [google_compute_url_map.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_iap_brand.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_brand) | resource |
| [google_iap_client.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_client) | resource |
| [google_iap_web_backend_service_iam_member.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_web_backend_service_iam_member) | resource |
| [google_project_service.apis](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.iap_accessor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.workforce_token_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_client_openid_userinfo.me](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_openid_userinfo) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name for the Cloud Run service (e.g., example.com) | `string` | n/a | yes |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | GitHub organization name for attribute condition | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | GCP Organization ID (required for Workforce Identity Pool) | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP region for Cloud Run | `string` | `"asia-northeast1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_run_url"></a> [cloud\_run\_url](#output\_cloud\_run\_url) | Cloud Run service URL (internal) |
| <a name="output_iap_client_id"></a> [iap\_client\_id](#output\_iap\_client\_id) | IAP OAuth Client ID (audience for ID token) |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | Service Account email for IAP access |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | Public service URL (via Load Balancer) |
| <a name="output_static_ip"></a> [static\_ip](#output\_static\_ip) | Static IP address for DNS configuration |
| <a name="output_workforce_audience"></a> [workforce\_audience](#output\_workforce\_audience) | Audience for GitHub Actions OIDC token |
| <a name="output_workforce_pool_id"></a> [workforce\_pool\_id](#output\_workforce\_pool\_id) | Workforce Identity Pool ID |
| <a name="output_workforce_pool_name"></a> [workforce\_pool\_name](#output\_workforce\_pool\_name) | Workforce Identity Pool full resource name |
| <a name="output_workforce_provider_id"></a> [workforce\_provider\_id](#output\_workforce\_provider\_id) | Workforce Identity Pool Provider ID |
<!-- END_TF_DOCS -->

## Usage

```hcl
module "example" {
  source = "./"
}
```
