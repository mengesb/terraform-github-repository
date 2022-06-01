#
# Terraform:: examples/foreach-example
# Plan:: main.tf
#

module "repository" {
  source = "../../"

  for_each = var.repositories

  allow_merge_commit     = each.value["allow_merge_commit"]
  allow_rebase_merge     = each.value["allow_rebase_merge"]
  allow_squash_merge     = each.value["allow_squash_merge"]
  delete_branch_on_merge = each.value["delete_branch_on_merge"]
  description            = each.value["description"]
  has_issues             = each.value["has_issues"]
  has_projects           = each.value["has_projects"]
  has_wiki               = each.value["has_wiki"]
  homepage_url           = each.value["homepage_url"]
  is_template            = each.value["is_template"]
  name                   = each.key
  visibility             = each.value["visibility"]
}
