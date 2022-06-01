#
# Terraform:: terraform-github-repository
# Plan:: providers.tf
#

terraform {
  experiments      = [module_variable_optional_attrs]
  required_version = "~> 1.1"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}
