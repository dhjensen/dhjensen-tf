provider "netlify" {
  token = var.netlify_token
}

provider "github" {
  owner = "dhjensen"
  token = var.github_token
}

// Configure the repository with the dynamically created Netlify key.
resource "github_repository_deploy_key" "key" {
  title      = "Netlify deploy key"
  repository = "dhjensen.dk"
  key        = netlify_deploy_key.key.public_key
  read_only  = false
}

// Create a webhook that triggers Netlify builds on push.
resource "github_repository_webhook" "main" {
  repository = github_repository_deploy_key.key.repository

  events     = ["delete", "push", "pull_request"]

  configuration {
    content_type = "json"
    url          = "https://api.netlify.com/hooks/github"
  }

  depends_on = [netlify_site.dhjensen]
}

resource "netlify_deploy_key" "key" {}

resource "netlify_site" "dhjensen" {
  name                = "dhjensen"
  custom_domain       = "dhjensen.dk"

  repo {
    repo_branch     = "master"
    command         = "make html"
    deploy_key_id   = netlify_deploy_key.key.id
    dir             = "output"
    provider        = "github"
    repo_path       = "dhjensen/dhjensen.dk"
  }
}