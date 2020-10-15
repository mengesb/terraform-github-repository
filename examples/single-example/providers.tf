#
# Terraform:: examples/single-example
# Plan:: providers.tf
#

terraform {
  required_version = "~> 0.13.0"
  required_providers {
    github = {
      version = "~> 3.0"
      source  = "hashicorp/github"
    }
  }
}

provider github {
  token        = var.token
  owner        = var.owner
  organization = var.organization
  base_url     = var.base_url
}
