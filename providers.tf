#
# Terraform:: terraform-github-repository
# Plan:: providers.tf
#

terraform {
  required_version = "~> 1.3"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.1"
    }
  }
}
