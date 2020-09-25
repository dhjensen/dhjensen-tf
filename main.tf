provider "netlify" {
    token               = var.netlify_token
}

resource "netlify_deploy_key" "key" {}

resource "netlify_site" "dhjensen" {
    name                = "dhjensen"
    custom_domain       = "dhjensen.dk"

    # You have to create or update the github.com app for netlify.
    repo {
        repo_branch     = "master"
        command         = "make html"
        deploy_key_id   = netlify_deploy_key.key.id
        dir             = "output"
        provider        = "github"
        repo_path       = "dhjensen/dhjensen.dk"
    }
}