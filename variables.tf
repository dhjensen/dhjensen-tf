variable "cloudflare_api_token" {
  type = string
  description = "Cloudflare api token for dns"
}
variable "github_token" {
  type = string
  description = "GitHub OAuth / Personal Access Token"
}
variable "gitea_url" {
  type = string
  description = "Gitea URL"
}
variable "gitea_token" {
  type = string
  description = "Gitea api token"
}
variable "pihole_url" {
  type = string
  description = "Pi-hole URL"
}
variable "pihole_password" {
  type = string
  description = "Pi-hole password"
}
variable "null_username" {
  type = string
  description = "SSH username"
}
variable "null_private_key" {
  type = string
  description = "Path to SSH private key"
}
variable "null_ip_address" {
  type = string
  description = "IP address of the ssh host"
}
# Oracle Cloud Infrastructure variables
variable "oci_tenancy_ocid" {
  type = string
  description = "OCID of the tenancy"
}
variable "oci_user_ocid" {
  type = string
  description = "OCID of the user calling the API"
}
variable "oci_private_key_path" {
  type = string
  description = "The path (including filename) of the private key stored on the computer"
}
# variable "oci_private_key_password" {
#   type = string
#   description = "Passphrase used for the key, if it's encrypted"
# }
variable "oci_fingerprint" {
  type = string
  description = "Fingerprint for the key pair being used"
}
variable "oci_region" {
  type = string
  description = "An OCI region"
}
