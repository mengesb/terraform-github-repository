#
# Terraform:: terraform-github-repository
# Plan:: main.tf
#

locals {
  # Construct a list of branches to create, with the first branch being the default for the org, the default the user wants
  branches = distinct(compact(concat([var.repository_default_branch, var.branch_default], var.branches)))
  pages = defaults(var.pages, {
    path = "/"
  })
}

resource "github_repository" "r" {
  lifecycle {
    ignore_changes = [auto_init]
  }

  allow_auto_merge                        = var.allow_auto_merge
  allow_merge_commit                      = var.allow_merge_commit
  allow_rebase_merge                      = var.allow_rebase_merge
  allow_squash_merge                      = var.allow_squash_merge
  archived                                = var.archived
  archive_on_destroy                      = var.archive_on_destroy
  auto_init                               = var.auto_init
  delete_branch_on_merge                  = var.delete_branch_on_merge
  description                             = var.description
  gitignore_template                      = var.gitignore_template
  has_downloads                           = var.has_downloads
  has_issues                              = var.has_issues
  has_projects                            = var.has_projects
  has_wiki                                = var.has_wiki
  homepage_url                            = var.homepage_url
  is_template                             = var.is_template
  license_template                        = var.license_template
  name                                    = var.name
  topics                                  = var.topics
  visibility                              = var.visibility
  vulnerability_alerts                    = var.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = var.ignore_vulnerability_alerts_during_read

  # deprecated
  # private                = var.private # use var.visibility
  # default_branch         = var.default_branch # use var.github_branch_default resource

  dynamic "template" {
    for_each = var.template == null ? [] : [0]

    content {
      owner      = var.template.owner
      repository = var.template.repository
    }
  }

  dynamic "pages" {
    for_each = var.pages == null ? [] : [0]

    content {
      source {
        branch = var.pages.source
        path   = var.pages.path
      }
    }
  }
}

resource "github_branch" "b" {
  # Create each branch if we auto_init and skip the default `main` branch
  for_each   = { for k in local.branches : k => k if github_repository.r.auto_init && k != var.repository_default_branch }
  repository = github_repository.r.name
  branch     = each.key
}

resource "github_branch_default" "b" {
  # Set the default branch if we auto_init and it isn't `main`
  for_each   = { for k in local.branches : k => k if github_repository.r.auto_init && k != var.repository_default_branch && k == var.branch_default}
  repository = github_repository.r.name
  branch     = github_branch.b[each.key].branch
}

data "github_repository" "r" {
  depends_on = [github_branch.b, github_branch_default.b]
  full_name  = github_repository.r.full_name
}
