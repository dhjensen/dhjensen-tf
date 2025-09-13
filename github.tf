locals {
  repositories = [
    {
      name        = "azuretest"
      description = "Azure / Terraform test project. Can never go public"
    },
    {
      name        = "beszel-agent"
      description = "Beszel agent with Nvidia support"
    },
    {
      name        = "beszel-docker"
      description = "Beszel system and docker monitoring"
    },
    {
      name        = "Crossfire"
      description = "Crypto.com crossire project"
    },
    {
      name        = "cyber-chef-docker"
      description = "CyperChef docker compose"
    },
    {
      name        = "dhjensen"
      description = "My GitHub profile README.md"
    },
    {
      name        = "dhjensen-tf"
      description = "Terraform for my private infrastructure"
    },
    {
      name        = "dotfiles"
      description = "My home directory dotfiles"
    },
    {
      name        = "dozzle-docker"
      description = "Dozzle docker container log output viewer"
    },
    {
      name        = "duplicati-docker"
      description = "Duplicati backup client"
    },
    {
      name        = "GerlingCourse"
      description = "Jeff Gerlling course stuff"
    },
    {
      name        = "homarr-docker"
      description = "Homarr dashboard"
    },
    {
      name        = "it-tools-docker"
      description = "IT tools static site"
    },
    {
      name        = "jackett-docker"
      description = "Jackett docker compose"
    },
    {
      name        = "jellyfin-docker"
      description = "Jellyfin media server"
    },
    {
      name        = "matomo-docker"
      description = "Matomo(Piwik) analytics"
    },
    {
      name        = "maubot-docker"
      description = "Maubot with ntfy integration"
    },
    {
      name        = "miscscripts"
      description = "Various scripts"
    },
    {
      name        = "netbox-compose"
      description = "Netbox"
    },
    {
      name        = "nginx-proxy-manager"
      description = "Nginx proxy manager"
    },
    {
      name        = "ntfy-docker"
      description = "Ntfy notification"
    },
    {
      name        = "ombi-docker"
      description = "Ombi media request handling"
    },
    {
      name        = "onedrive-compose"
      description = "OneDrive linux client"
    },
    {
      name        = "openspeedtest-docker"
      description = "OpenSpeedTest"
    },
    {
      name        = "pythontest"
      description = "Python course source"
    },
    {
      name        = "qbittorrent-docker"
      description = "qbittorrent client"
    },
    {
      name        = "radarr-docker"
      description = "Radarr"
    },
    {
      name        = "raspberry"
      description = "Configuring raspberry pi as a docker host"
    }
  ]
}

resource "github_repository" "repository" {
  for_each = {
    for repository in local.repositories : repository.name => repository
  }

  name                    = each.value.name
  description             = each.value.description
  has_issues              = true
  has_discussions         = true
  has_projects            = false
  has_wiki                = false
  delete_branch_on_merge  = true
  has_downloads           = false
}
