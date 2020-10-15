#
# Terraform:: examples/single-example
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

variable description {
  type        = string
  description = "A description of the repository"
  default     = null
}

variable homepage_url {
  type        = string
  description = "URL of a page description the project"
  default     = null
}

variable visibility {
  type        = string
  description = "Can be public or private. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be internal."
  default     = "public"
}

variable has_issues {
  type        = bool
  description = "Set to true to enable the GitHub Issues features on the repository"
  default     = false
}

variable has_projects {
  type        = bool
  description = "Set to true to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error"
  default     = false
}

variable has_wiki {
  type        = bool
  description = "Set to true to enable the GitHub Wiki features on the repository"
  default     = false
}

variable is_template {
  type        = bool
  description = "Set to true to tell GitHub that this is a template repository"
  default     = false
}

variable allow_merge_commit {
  type        = bool
  description = "Set to false to disable merge commits on the repository"
  default     = true
}

variable allow_squash_merge {
  type        = bool
  description = "Set to false to disable squash merges on the repository"
  default     = true
}

variable allow_rebase_merge {
  type        = bool
  description = "Set to false to disable rebase merges on the repository"
  default     = true
}

variable delete_branch_on_merge {
  type        = bool
  description = "Automatically delete head branch after a pull request is merged. Defaults to false"
  default     = false
}

variable has_downloads {
  type        = bool
  description = "Set to true to enable the (deprecated) downloads features on the repository"
  default     = false
}

variable auto_init {
  type        = bool
  description = "Set to true to produce an initial commit in the repository"
  default     = false
}

variable gitignore_template {
  type        = string
  description = "Use the name of the template without the extension. For example, 'Haskell'"
  default     = null
}

variable license_template {
  type        = string
  description = "Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'"
  default     = null
}

variable archived {
  type        = bool
  description = "Specifies if the repository should be archived. Defaults to false"
  default     = false
}

variable topics {
  type        = list(string)
  description = "The list of topics of the repository"
  default     = null
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
