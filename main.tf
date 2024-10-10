provider "github" {
  owner = "dhjensen"
  token = var.github_token
}

provider "cloudflare" {
  api_token    = var.cloudflare_api_token
}
