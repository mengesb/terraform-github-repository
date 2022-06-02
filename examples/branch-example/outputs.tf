#
# Terraform:: examples/branch-example
# Plan:: outputs.tf
#

output "auto_init" {
  value = module.direct.auto_init
}

output "branches" {
  value = module.direct.branches
}

output "delete_branch_on_merge" {
  value = module.direct.delete_branch_on_merge
}

output "default_branch" {
  value = module.direct.default_branch
}

output "name" {
  value = module.direct.name
}
