provider "github" {
  owner = "dhjensen"
  token = var.github_token
}

provider "cloudflare" {
  email       = var.cloudflare_email
  api_token   = var.cloudflare_api_token
}
