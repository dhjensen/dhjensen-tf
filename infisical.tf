resource "infisical_project" "dhjensen" {
  name                        = "dhjensen"
  slug                        = "dhjensen"
  description                 = "All items for dhjensen infrastructure"
  has_delete_protection       = false
  should_create_default_envs  = true
  type                        = "secret-manager"
}
resource "infisical_project_user" "dhjensen" {
  project_id = infisical_project.dhjensen.id
  username   = "dhjen@outlook.com"
  roles = [
    {
      role_slug = "admin"
    }
  ]
}
resource "infisical_project_environment" "prod" {
  name       = "Prod"
  project_id = infisical_project.dhjensen.id
  slug       = "prod"
  position   = 1
}
resource "infisical_project_environment" "daniel-pc" {
  name       = "daniel-pc"
  project_id = infisical_project.dhjensen.id
  slug       = "danielpc"
  position   = 2
}
resource "infisical_project_environment" "pi2" {
  name       = "pi2"
  project_id = infisical_project.dhjensen.id
  slug       = "pi2"
  position   = 3
}
resource "infisical_project_environment" "instance-001" {
  name       = "instance-001"
  project_id = infisical_project.dhjensen.id
  slug       = "instance001"
  position   = 4
}
resource "infisical_secret_folder" "folders-prod" {
  for_each = {
    for repo in local.repositories : repo.name => repo
  }
  environment_slug  = infisical_project_environment.prod.slug
  folder_path       = "/"
  name              = each.value.name
  project_id        = infisical_project.dhjensen.id
  # 0.15.43 fails to configure this with 502 error
  # force_delete      = false
}
resource "infisical_secret_folder" "folders-daniel-pc" {
  for_each = {
    for repo in local.repositories : repo.name => repo
  }
  environment_slug  = infisical_project_environment.daniel-pc.slug
  folder_path       = "/"
  name              = each.value.name
  project_id        = infisical_project.dhjensen.id
  # 0.15.43 fails to configure this with 502 error
  # force_delete      = false
}
resource "infisical_secret_folder" "folders-pi2" {
  for_each = {
    for repo in local.repositories : repo.name => repo
  }
  environment_slug  = infisical_project_environment.pi2.slug
  folder_path       = "/"
  name              = each.value.name
  project_id        = infisical_project.dhjensen.id
  # 0.15.43 fails to configure this with 502 error
  # force_delete      = false
}
resource "infisical_secret_folder" "folders-instance-001" {
  for_each = {
    for repo in local.repositories : repo.name => repo
  }
  environment_slug  = infisical_project_environment.instance-001.slug
  folder_path       = "/"
  name              = each.value.name
  project_id        = infisical_project.dhjensen.id
  # 0.15.43 fails to configure this with 502 error
  # force_delete      = false
}