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
      version = "5.10.1"
    }
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
    gitea = {
      source  = "go-gitea/gitea"
      version = "0.7.0"
    }
    pihole = {
      source = "ryanwholey/pihole"
      version = "2.0.0-beta.1"
    }
  }

  required_version = ">= 1.13"
}
