#
# Terraform:: examples/template-example
# Plan:: providers.tf
#

terraform {
  required_version = "~> 1.0"
  required_providers {
    github = {
      version = "~> 5.0"
      source  = "integrations/github"
    }
  }
}

provider "github" {
  token        = var.token
  owner        = var.owner
  organization = var.organization
  base_url     = var.base_url
}
