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
