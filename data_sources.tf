#
# Terraform:: terraform-github-repository
# Plan:: data_sources.tf
#

data "github_repository" "r" {
  depends_on = [github_branch.b, github_branch_default.b]
  full_name  = github_repository.r.full_name
}

data "github_repository_branches" "r" {
  depends_on = [github_branch.b, github_branch_default.b]
  repository = github_repository.r.name
}
