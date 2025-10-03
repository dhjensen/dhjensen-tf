provider "cloudflare" {
  api_token    = var.cloudflare_api_token
}
provider "github" {
  token = var.github_token
}
provider "gitea" {
  base_url  = var.gitea_url
  token     = var.gitea_token
}
provider "pihole" {
  url       = var.pihole_url
  password  = var.pihole_password
}
# Oracle Cloud Infrastructure
provider "oci" {
  tenancy_ocid          = var.oci_tenancy_ocid
  user_ocid             = var.oci_user_ocid
  private_key_path      = var.oci_private_key_path
  fingerprint           = var.oci_fingerprint
  region                = var.oci_region
}
