#
# Terraform:: terraform-github-repository
# Plan:: providers.tf
#

terraform {
  required_version = "~> 0.13"

  required_providers {
    github = ">= 2.9.2"
  }
}
