resource "gitea_repository" "mirror" {
  for_each = {
    for repository in local.repositories : repository.name => repository
  }

  name                          = each.value.name
  username                      = "dhjensen"
  allow_manual_merge            = false
  allow_merge_commits           = false
  allow_rebase                  = false
  allow_rebase_explicit         = false
  allow_squash_merge            = false
  archive_on_destroy            = false
  archived                      = false
  auto_init                     = false
  autodetect_manual_merge       = true
  description                   = each.value.description
  has_issues                    = true
  has_projects                  = true
  has_pull_requests             = true
  has_wiki                      = true
  migration_clone_address       = "https://github.com/dhjensen/${each.value.name}.git"
  migration_milestones          = true
  migration_mirror_interval     = "24h0m0s"
  migration_releases            = false
  migration_service             = "github"
  migration_service_auth_token  = var.github_token
  mirror                        = true
  private                       = false
  depends_on                    = [github_repository.repository]
}
