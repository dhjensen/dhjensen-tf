terraform {

  backend "remote" {
    organization = "dhjensen"

    workspaces {
      name = "dhjensen"
    }
  }

  required_providers {
    netlify = {
      source = "terraform-providers/netlify"
      version = "= 0.4.0"
    }
    github = {
      source = "hashicorp/github"
      version = "3.0.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.12.0"
    }
  }
  required_version = ">= 0.13"
}
