variable "cloudflare_email" {
  type= string
  description = "Cloudflare e-mail account address"
}
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
