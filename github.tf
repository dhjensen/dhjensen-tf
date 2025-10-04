locals {
  hosts = [
    {
      ip    = "192.168.0.76"
      user  = "dhjensen"
    },
    {
      ip    = "89.168.73.78"
      user  = "ubuntu"
    }
  ]
}

locals {
  repositories = [
    {
      name        = "atlas-docker"
      description = "Atlas network visualization tool"
      clone       = true
    },
    {
      name        = "beszel-agent"
      description = "Beszel agent with Nvidia support"
      clone       = false
    },
    {
      name        = "beszel-docker"
      description = "Beszel system and docker monitoring"
      clone       = true
    },
    {
      name        = "croc-docker"
      description = "Croc relay server"
      clone       = true
    },
    {
      name        = "Crossfire"
      description = "Crypto.com crossire project"
      clone       = false
    },
    {
      name        = "cyber-chef-docker"
      description = "CyperChef"
      clone       = true
    },
    {
      name        = "dhjensen"
      description = "My GitHub profile README.md"
      clone       = false
    },
    {
      name        = "dhjensen-tf"
      description = "Terraform for my private infrastructure"
      clone       = false
    },
    {
      name        = "dotfiles"
      description = "My home directory dotfiles"
      clone       = false
    },
    {
      name        = "dozzle-docker"
      description = "Dozzle docker container log output viewer"
      clone       = true
    },
    {
      name        = "duplicati-docker"
      description = "Duplicati backup client"
      clone       = true
    },
    {
      name        = "GerlingCourse"
      description = "Jeff Gerlling course stuff"
      clone       = false
    },
    {
      name        = "gitea-docker"
      description = "Gitea GitHub mirror"
      clone       = true
    },
    {
      name        = "homarr-docker"
      description = "Homarr dashboard"
      clone       = true
    },
    {
      name        = "it-tools-docker"
      description = "IT tools static site"
      clone       = true
    },
    {
      name        = "jackett-docker"
      description = "Jackett"
      clone       = true
    },
    {
      name        = "jellyfin-docker"
      description = "Jellyfin media server"
      clone       = false
    },
    {
      name        = "matomo-docker"
      description = "Matomo(Piwik) analytics"
      clone       = true
    },
    {
      name        = "maubot-docker"
      description = "Maubot with ntfy integration"
      clone       = true
    },
    {
      name        = "miscscripts"
      description = "Various scripts"
      clone       = false
    },
    {
      name        = "netbox-compose"
      description = "Netbox"
      clone       = true
    },
    {
      name        = "nginx-proxy-manager"
      description = "Nginx proxy manager"
      clone       = true
    },
    {
      name        = "ntfy-docker"
      description = "Ntfy notification"
      clone       = true
    },
    {
      name        = "ombi-docker"
      description = "Ombi media request handling"
      clone       = true
    },
    {
      name        = "onedrive-compose"
      description = "OneDrive linux client"
      clone       = false
    },
    {
      name        = "openspeedtest-docker"
      description = "OpenSpeedTest"
      clone       = true
    },
    {
      name        = "pi-hole-docker"
      description = "Pi-hole blocking them ads"
      clone       = true
    },
    {
      name        = "pythontest"
      description = "Python course source"
      clone       = false
    },
    {
      name        = "qbittorrent-docker"
      description = "qbittorrent client"
      clone       = false
    },
    {
      name        = "radarr-docker"
      description = "Radarr"
      clone       = false
    },
    {
      name        = "raspberry"
      description = "Configuring raspberry pi OS as a docker host"
      clone       = false
    },
    {
      name        = "rustdesk-docker"
      description = "RustDesk"
      clone       = true
    },
    {
      name        = "sonarr-docker"
      description = "Sonarr"
      clone       = false
    },
    {
      name        = "vagrant"
      description = "Vagrant"
      clone       = false
    },
    {
      name        = "vault-docker"
      description = "HashiCorp Vault"
      clone       = true
    },
    {
      name        = "wg-portal-docker"
      description = "WireGuard portal"
      clone       = true
    },
    {
      name        = "whats-up-docker"
      description = "What's up Docker with ntfy inegration"
      clone       = true
    },
    {
      name        = "traefik-docker"
      description = "Traefik reverse proxy"
      clone       = true
    },
    {
      name        = "crowdsec-docker"
      description = "Crowdsec dynamic IP banlist"
      clone       = true
    }
  ]
}
locals {
  host_repo_map = merge([
    for host in local.hosts : {
      for repo in local.repositories : "${host.ip}.${repo.name}" => {
        ip        = host.ip
        user      = host.user
        reponame  = repo.name
      } if repo.clone
    }
  ]...)
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

output "ssh_clone_url" {
  value = [for rep in github_repository.repository : rep.ssh_clone_url]
}

resource "null_resource" "git_clone" {
  for_each = local.host_repo_map

  provisioner "remote-exec" {
    inline = [
      "cd ${each.value.reponame} || (git clone ${github_repository.repository[each.value.reponame].http_clone_url} ${each.value.reponame})",
      "git -C ~/${each.value.reponame} pull"
    ]

    connection {
      type        = "ssh"
      user        = each.value.user
      private_key = file(var.null_private_key)
      host        = each.value.ip
    }
  }
  depends_on    = [github_repository.repository]
}
