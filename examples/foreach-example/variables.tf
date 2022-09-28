#
# Terraform:: examples/foreach-example
# Plan:: variables.tf
#

variable "token" {
  type        = string
  description = "A GitHub OAuth / Personal Access Token."
  default     = null
}

variable "owner" {
  type        = string
  description = "Target GitHub individual account to manage. Conflicts with organization."
  default     = null
}

variable "base_url" {
  type        = string
  description = "Target GitHub base API endpoin."
  default     = null
}

/* */

variable "repositories" {
  type = map(object({
    allow_merge_commit     = optional(bool, true)
    allow_rebase_merge     = optional(bool, true)
    allow_squash_merge     = optional(bool, true)
    archived               = optional(bool, false)
    auto_init              = optional(bool, false)
    delete_branch_on_merge = optional(bool, false)
    description            = optional(string, null)
    gitignore_template     = optional(string, null)
    has_downloads          = optional(bool, false)
    has_issues             = optional(bool, false)
    has_projects           = optional(bool, false)
    has_wiki               = optional(bool, false)
    homepage_url           = optional(string, null)
    is_template            = optional(bool, false)
    license_template       = optional(string, null)
    template               = optional(map(string), {})
    topics                 = optional(list(string), [])
    visibility             = optional(string, "public")
  }))
  description = "GitHub repositories to manage"
}
