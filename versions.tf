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
      version = "5.17.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.11.1"
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
      version = "8.1.0"
    }
    infisical = {
      source = "Infisical/infisical"
      version = "0.16.3"
    }
  }  
  required_version = ">= 1.13"
}
