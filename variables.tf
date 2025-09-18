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
