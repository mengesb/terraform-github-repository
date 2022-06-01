#
# Terraform:: examples/template-example
# Plan:: outputs.tf
#

output "tmp" {
  value = module.tmp.repository
}
