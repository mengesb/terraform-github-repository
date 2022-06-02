#
# Terraform:: examples/foreach-example
# Plan:: outputs.tf
#

output "repositories" {
  value = flatten([for r in module.repository : [r.repository]]) # { for r, v in local.repo :  => v }
}
