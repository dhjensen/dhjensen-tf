terraform {

  backend "remote" {
    organization = "dhjensen"

    workspaces {
      name = "dhjensen"
    }
  }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "5.10.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
    gitea = {
      source  = "go-gitea/gitea"
      version = "0.7.0"
    }
  }

  required_version = ">= 1.2"
}
