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
    allow_merge_commit     = optional(bool)
    allow_rebase_merge     = optional(bool)
    allow_squash_merge     = optional(bool)
    archived               = optional(bool)
    auto_init              = optional(bool)
    delete_branch_on_merge = optional(bool)
    description            = optional(string)
    gitignore_template     = optional(string)
    has_downloads          = optional(bool)
    has_issues             = optional(bool)
    has_projects           = optional(bool)
    has_wiki               = optional(bool)
    homepage_url           = optional(string)
    is_template            = optional(bool)
    license_template       = optional(string)
    template               = optional(map(string))
    topics                 = optional(list(string))
    visibility             = optional(string)
  }))
  description = "GitHub repositories to manage"
}
