#
# Terraform:: examples/single-example
# Plan:: outputs.tf
#

output direct {
  value = module.direct.repository
}

output name {
  value = module.direct.repository.name
}
