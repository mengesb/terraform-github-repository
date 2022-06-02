#
# Terraform:: examples/branch-example
# Plan:: providers.tf
#

terraform {
  required_version = "~> 1.0"
  
  required_providers {
    github = {
      version = "~> 4.0"
      source  = "integrations/github"
    }
  }
}

provider "github" {
  token    = var.token
  owner    = var.owner
  base_url = var.base_url
}