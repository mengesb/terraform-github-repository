#
# Terraform:: terraform-github-repository
# Plan:: variables.tf
#

variable name {
  type        = string
  description = "The name of the repository"

  validation {
    condition = (
      length(regexall("^([[:alnum:]]+[\\w\\-]+?)$", var.name)) == 1 &&
      flatten(regexall("^([[:alnum:]]+[\\w\\-]+?)$", var.name))[0] == var.name
    )
    error_message = "Repository names must begin with an alphanumeric character and contain only the following valid characters: [0-9A-Za-z_\\-]."
  }
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

  validation {
    condition = (
      var.visibility == null ? true : contains(["internal", "private", "public"], var.visibility)
    )
    error_message = "Provided value for visibility not in allowed list. Must be one of 'internal', 'private', or 'public'."
  }
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

  validation {
    condition = (
      var.license_template == null ? true : contains(["afl-3.0", "apache-2.0", "artistic-2.0", "bsl-1.0", "bsd-2-clause", "bsd-3-clause", "bsd-3-clause-clear", "cc", "c0-1.0", "cc-by-4.0", "cc-by-sa-4.0", "wtfpl", "ecl-2.0", "epl-1.0", "eupl-1.1", "agpl-3.0", "gpl", "gpl-2.0", "gpl-3.0", "lgpl", "lgpl-2.1", "lgpl-3.0", "lppl-1.3c", "ms-pl", "mpl-2.0", "osl-3.0", "ofl-1.1", "ncsa", "zlib"], var.license_template)
    )
    error_message = "Provided value for license_template not in allowed list. Please see: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/licensing-a-repository#searching-github-by-license-type."
  }
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
