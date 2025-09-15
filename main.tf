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
