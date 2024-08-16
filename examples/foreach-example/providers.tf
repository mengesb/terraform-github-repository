#
# Terraform:: examples/foreach-example
# Plan:: providers.tf
#

terraform {
  required_version = "~> 1.3"

  required_providers {
    github = {
      version = "~> 6.0"
      source  = "integrations/github"
    }
  }
}

provider "github" {
  token    = var.token
  owner    = var.owner
  base_url = var.base_url
}
