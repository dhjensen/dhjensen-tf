terraform {

  backend "remote" {
    organization = "dhjensen"

    workspaces {
      name = "dhjensen"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.12.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.7.5"
    }
    gitea = {
      source  = "go-gitea/gitea"
      version = "0.7.0"
    }
    pihole = {
      source  = "ryanwholey/pihole"
      version = "2.0.0-beta.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
    oci = {
      source  = "oracle/oci"
      version = "7.24.0"
    }
    infisical = {
      source = "Infisical/infisical"
      version = "0.15.39"
    }
  }

  required_version = ">= 1.13"
}
