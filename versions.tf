terraform {

  backend "remote" {
    organization = "dhjensen"

    workspaces {
      name = "dhjensen"
    }
  }

  required_providers {
    github = {
      source = "integrations/github"
      version = "4.2.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.43.0"
    }
  }
  required_version = ">= 0.13"
}
