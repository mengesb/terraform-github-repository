#
# Terraform:: examples/branch-example
# Plan:: main.tf
#

module "direct" {
  source = "../../"

  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_squash_merge     = var.allow_squash_merge
  archived               = var.archived
  auto_init              = var.auto_init
  branch_default         = var.branch_default
  delete_branch_on_merge = var.delete_branch_on_merge
  description            = var.description
  gitignore_template     = var.gitignore_template
  has_downloads          = var.has_downloads
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  homepage_url           = var.homepage_url
  is_template            = var.is_template
  license_template       = var.license_template
  name                   = var.name
  template               = var.template
  topics                 = var.topics
  visibility             = var.visibility
}
