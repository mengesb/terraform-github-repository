#
# Terraform:: examples/foreach-example
# Plan:: foreach.auto.tfvars
#

repositories = {
  terraform-example-module = {
    auto_init              = true
    delete_branch_on_merge = true
    visibility             = "private"
  },
  tf_example_plan = {
    delete_branch_on_merge = true
    visibility             = "public"
  },
}