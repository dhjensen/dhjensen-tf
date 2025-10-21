locals {
  hosts = [
    {
      ip    = "192.168.86.22"
      user  = "dhjensen"
    },
    {
      ip    = oci_core_instance.dhjensen-instance-001.public_ip
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
      archived    = false
    },
    {
      name        = "beszel-agent"
      description = "Beszel agent with Nvidia support"
      clone       = false
      archived    = false
    },
    {
      name        = "beszel-agent-intel"
      description = "Beszel agent with Intel support"
      clone       = false
      archived    = false
    },
    {
      name        = "beszel-docker"
      description = "Beszel system and docker monitoring"
      clone       = true
      archived    = false
    },
    {
      name        = "croc-docker"
      description = "Croc relay server"
      clone       = true
      archived    = false
    },
    {
      name        = "Crossfire"
      description = "Crypto.com crossire project"
      clone       = false
      archived    = true
    },
    {
      name        = "cyber-chef-docker"
      description = "CyperChef"
      clone       = true
      archived    = false
    },
    {
      name        = "dhjensen"
      description = "My GitHub profile README.md"
      clone       = false
      archived    = false
    },
    {
      name        = "dhjensen-tf"
      description = "Terraform for my private infrastructure"
      clone       = false
      archived    = false
    },
    {
      name        = "dotfiles"
      description = "My home directory dotfiles"
      clone       = false
      archived    = false
    },
    {
      name        = "dozzle-docker"
      description = "Dozzle docker container log output viewer"
      clone       = true
      archived    = false
    },
    {
      name        = "duplicati-docker"
      description = "Duplicati backup client"
      clone       = true
      archived    = false
    },
    {
      name        = "GerlingCourse"
      description = "Jeff Gerlling course stuff"
      clone       = false
      archived    = true
    },
    {
      name        = "gitea-docker"
      description = "Gitea GitHub mirror"
      clone       = true
      archived    = false
    },
    {
      name        = "homarr-docker"
      description = "Homarr dashboard"
      clone       = true
      archived    = false
    },
    {
      name        = "it-tools-docker"
      description = "IT tools static site"
      clone       = true
      archived    = false
    },
    {
      name        = "jackett-docker"
      description = "Jackett"
      clone       = true
      archived    = false
    },
    {
      name        = "jellyfin-docker"
      description = "Jellyfin media server"
      clone       = false
      archived    = false
    },
    {
      name        = "matomo-docker"
      description = "Matomo(Piwik) analytics"
      clone       = true
      archived    = false
    },
    {
      name        = "maubot-docker"
      description = "Maubot with ntfy integration"
      clone       = true
      archived    = false
    },
    {
      name        = "miscscripts"
      description = "Various scripts"
      clone       = false
      archived    = false
    },
    {
      name        = "netbox-compose"
      description = "Netbox"
      clone       = true
      archived    = false
    },
    {
      name        = "nginx-proxy-manager"
      description = "Nginx proxy manager"
      clone       = true
      archived    = true
    },
    {
      name        = "ntfy-docker"
      description = "Ntfy notification"
      clone       = true
      archived    = false
    },
    {
      name        = "ombi-docker"
      description = "Ombi media request handling"
      clone       = true
      archived    = false
    },
    {
      name        = "onedrive-compose"
      description = "OneDrive linux client (Archived)"
      clone       = false
      archived    = true
    },
    {
      name        = "openspeedtest-docker"
      description = "OpenSpeedTest"
      clone       = true
      archived    = false
    },
    {
      name        = "pi-hole-docker"
      description = "Pi-hole blocking them ads"
      clone       = true
      archived    = false
    },
    {
      name        = "pythontest"
      description = "Python course source"
      clone       = false
      archived    = true
    },
    {
      name        = "qbittorrent-docker"
      description = "qbittorrent client"
      clone       = false
      archived    = false
    },
    {
      name        = "radarr-docker"
      description = "Radarr"
      clone       = false
      archived    = false
    },
    {
      name        = "raspberry"
      description = "Configure docker host etc."
      clone       = false
      archived    = false
    },
    {
      name        = "rustdesk-docker"
      description = "RustDesk"
      clone       = true
      archived    = false
    },
    {
      name        = "sonarr-docker"
      description = "Sonarr"
      clone       = false
      archived    = false
    },
    {
      name        = "vagrant"
      description = "Vagrant"
      clone       = false
      archived    = true
    },
    {
      name        = "vault-docker"
      description = "HashiCorp Vault (Archived)"
      clone       = true
      archived    = true
    },
    {
      name        = "wg-portal-docker"
      description = "WireGuard portal"
      clone       = true
      archived    = false
    },
    {
      name        = "whats-up-docker"
      description = "What's up Docker with ntfy inegration"
      clone       = true
      archived    = false
    },
    {
      name        = "traefik-docker"
      description = "Traefik reverse proxy"
      clone       = true
      archived    = false
    },
    {
      name        = "crowdsec-docker"
      description = "Crowdsec dynamic IP banlist"
      clone       = true
      archived    = false
    },
    {
      name        = "beszel-agent-normal"
      description = "Beszel agent"
      clone       = true
      archived    = false
    },
    {
      name        = "infisical-docker"
      description = "Infisical is the open-source platform for secrets management, PKI, and SSH access."
      clone       = true
      archived    = false
    },
    {
      name        = "arch"
      description = "My personal arch linux setup written in ansible"
      clone       = false
      archived    = false
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
  archived                = each.value.archived
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
resource "null_resource" "install_git" {
  for_each = {
    for host in local.hosts : host.ip => host
  }
  provisioner "remote-exec" {
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "sudo apt-get update -y",
      "sudo apt-get install -y git"
    ]
    connection {
      type        = "ssh"
      user        = each.value.user
      private_key = file(var.null_private_key)
      host        = each.value.ip
      timeout     = "2m"
    }
  }
  depends_on    = [oci_core_instance.dhjensen-instance-001]
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
  depends_on    = [null_resource.install_git, github_repository.repository]
}
