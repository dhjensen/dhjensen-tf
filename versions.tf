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
      version = "5.9.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }

  required_version = ">= 1.2"
}
