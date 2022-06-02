#
# Terraform:: examples/template-example
# Plan:: main.tf
#

module "tmp" {
  source = "../../"

  name     = var.name
  template = var.template
}
