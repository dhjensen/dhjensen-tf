locals {
  repositories = [
    {
      name        = "beszel-agent"
      description = "Beszel agent with Nvidia support"
    },
    {
      name        = "beszel-docker"
      description = "Beszel system and docker monitoring"
    },
    {
      name        = "croc-docker"
      description = "Croc relay server"
    },
    {
      name        = "Crossfire"
      description = "Crypto.com crossire project"
    },
    {
      name        = "cyber-chef-docker"
      description = "CyperChef"
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
      name        = "gitea-docker"
      description = "Gitea GitHub mirror"
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
      description = "Jackett"
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
      name        = "pi-hole-docker"
      description = "Pi-hole blocking them ads"
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
      description = "Configuring raspberry pi OS as a docker host"
    },
    {
      name        = "rustdesk-docker"
      description = "RustDesk"
    },
    {
      name        = "sonarr-docker"
      description = "Sonarr"
    },
    {
      name        = "vagrant"
      description = "Vagrant"
    },
    {
      name        = "wg-portal-docker"
      description = "WireGuard portal"
    },
    {
      name        = "whats-up-docker"
      description = "What's up Docker with ntfy inegration"
    }
  ]
}

resource "github_repository" "repository" {
  for_each = {
    for repository in local.repositories : repository.name => repository
  }

  name                    = each.value.name
  description             = each.value.description
  visibility              = "public"
  has_issues              = true
  has_discussions         = true
  has_projects            = false
  has_wiki                = false
  allow_merge_commit      = true
  allow_squash_merge      = true
  allow_rebase_merge      = false
  delete_branch_on_merge  = true
  has_downloads           = false
  auto_init               = true
  license_template        = "gpl-3.0"
}

resource "github_branch_default" "main" {
  for_each = {
    for repository in local.repositories : repository.name => repository
  }
  repository        = github_repository.repository[each.value.name].name
  branch            = "main"
}

resource "github_repository_ruleset" "default_branch_protection" {
  for_each = {
    for repository in local.repositories : repository.name => repository
  }
  enforcement = "active"
  name        = "default_branch_protection"
  rules {
    creation                = true
    deletion                = true
    non_fast_forward        = true
    pull_request {}
    required_linear_history = false
    required_signatures     = false
    update                  = false
  }
  target      = "branch"
  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }
  repository  = github_repository.repository[each.value.name].name
}

