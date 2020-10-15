#
# Terraform:: examples/template-example
# Plan:: variables.tf
#

variable token {
  type        = string
  description = "A GitHub OAuth / Personal Access Token."
  default     = null
}

variable organization {
  type        = string
  description = "Target GitHub organization account to manage. Conflicts with ownerand requires token."
  default     = null
}

variable owner {
  type        = string
  description = "Target GitHub individual account to manage. Conflicts with organization."
  default     = null
}

variable base_url {
  type        = string
  description = "Target GitHub base API endpoin."
  default     = null
}

/* */

variable name {
  type        = string
  description = "The name of the repository"
}

variable template {
  type = object(
    {
      owner      = string # The GitHub organization or user the template repository is owned by
      repository = string # The name of the template repository
    }
  )
  description = "Supports two arguments: owner, template. Please see the [GitHub repository](https://www.terraform.io/docs/providers/github/r/repository.html#template-repositories) resource documentation for structure."
  default     = null
}
