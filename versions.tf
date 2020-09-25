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
  }
  required_version = ">= 0.13"
}
