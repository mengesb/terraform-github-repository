#
# Terraform:: examples/foreach-example
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

variable repositories {
  type = map(object({
    allow_merge_commit     = bool
    allow_rebase_merge     = bool
    allow_squash_merge     = bool
    archived               = bool
    auto_init              = bool
    delete_branch_on_merge = bool
    description            = string
    gitignore_template     = string
    has_downloads          = bool
    has_issues             = bool
    has_projects           = bool
    has_wiki               = bool
    homepage_url           = string
    is_template            = bool
    license_template       = string
    template               = map(string)
    topics                 = list(string)
    visibility             = string
  }))
  description = "GitHub repositories to manage"
}
