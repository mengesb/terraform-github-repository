#
# Terraform:: terraform-github-repository
# Plan:: variables.tf
#

variable "name" {
  type        = string
  sensitive   = false
  description = "The name of the repository"

  validation {
    condition = (
      length(regexall("^([[:alnum:]]+[\\w\\-]+?)$", var.name)) == 1 &&
      flatten(regexall("^([[:alnum:]]+[\\w\\-]+?)$", var.name))[0] == var.name
    )
    error_message = "Repository names must begin with an alphanumeric character and contain only the following valid characters: [0-9A-Za-z_\\-]."
  }
}

variable "description" {
  type        = string
  sensitive   = false
  description = "A description of the repository"
  default     = null
}

variable "homepage_url" {
  type        = string
  sensitive   = false
  description = "URL of a page description the project"
  default     = null
}

variable "visibility" {
  type        = string
  sensitive   = false
  description = "Can be public or private. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be internal."
  default     = "public"

  validation {
    condition = (
      var.visibility == null ? true : contains(["internal", "private", "public"], var.visibility)
    )
    error_message = "Provided value for visibility not in allowed list. Must be one of 'internal', 'private', or 'public'."
  }
}

variable "has_issues" {
  type        = bool
  sensitive   = false
  description = "Set to true to enable the GitHub Issues features on the repository"
  default     = false
}

variable "has_projects" {
  type        = bool
  sensitive   = false
  description = "Set to true to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error"
  default     = false
}

variable "has_wiki" {
  type        = bool
  sensitive   = false
  description = "Set to true to enable the GitHub Wiki features on the repository"
  default     = false
}

variable "is_template" {
  type        = bool
  sensitive   = false
  description = "Set to true to tell GitHub that this is a template repository"
  default     = false
}

variable "allow_merge_commit" {
  type        = bool
  sensitive   = false
  description = "Set to false to disable merge commits on the repository"
  default     = true
}

variable "allow_squash_merge" {
  type        = bool
  sensitive   = false
  description = "Set to false to disable squash merges on the repository"
  default     = true
}

variable "allow_rebase_merge" {
  type        = bool
  sensitive   = false
  description = "Set to false to disable rebase merges on the repository"
  default     = true
}

variable "allow_auto_merge" {
  type        = bool
  sensitive   = false
  description = "Set to true to allow auto-merging pull requests on the repository"
  default     = false
}

variable "delete_branch_on_merge" {
  type        = bool
  sensitive   = false
  description = "Automatically delete head branch after a pull request is merged. Defaults to false"
  default     = false
}

variable "has_downloads" {
  type        = bool
  sensitive   = false
  description = "Set to true to enable the (deprecated) downloads features on the repository"
  default     = false
}

variable "auto_init" {
  type        = bool
  sensitive   = false
  description = "Set to true to produce an initial commit in the repository"
  default     = false
}

variable "gitignore_template" {
  type        = string
  sensitive   = false
  description = "Use the name of the template without the extension. For example, 'Haskell'"
  default     = null
}

variable "license_template" {
  type        = string
  sensitive   = false
  description = "Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'"
  default     = null

  validation {
    condition = (
      var.license_template == null ? true : contains(["afl-3.0", "apache-2.0", "artistic-2.0", "bsl-1.0", "bsd-2-clause", "bsd-3-clause", "bsd-3-clause-clear", "cc", "c0-1.0", "cc-by-4.0", "cc-by-sa-4.0", "wtfpl", "ecl-2.0", "epl-1.0", "eupl-1.1", "agpl-3.0", "gpl", "gpl-2.0", "gpl-3.0", "lgpl", "lgpl-2.1", "lgpl-3.0", "lppl-1.3c", "ms-pl", "mpl-2.0", "osl-3.0", "ofl-1.1", "ncsa", "zlib"], var.license_template)
    )
    error_message = "Provided value for license_template not in allowed list. Please see: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/licensing-a-repository#searching-github-by-license-type."
  }
}

variable "archived" {
  type        = bool
  sensitive   = false
  description = "Specifies if the repository should be archived. Defaults to false"
  default     = false
}

variable "archive_on_destroy" {
  type        = bool
  sensitive   = false
  description = "Set to true to archive the repository instead of deleting on destroy"
  default     = false
}

variable "topics" {
  type        = list(string)
  sensitive   = false
  description = "The list of topics of the repository"
  default     = null
}

variable "template" {
  type = object(
    {
      owner      = string # The GitHub organization or user the template repository is owned by
      repository = string # The name of the template repository
    }
  )
  sensitive   = false
  description = "Use a template repository to create this resource. See [Template Repositories](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#template-repositories) for details."
  default     = null
}

variable "pages" {
  type = object(
    {
      branch = string                # The repository branch used to publish the site's source files
      path   = optional(string, "/") # The repository directory from which the site publishes
    }
  )
  sensitive   = false
  description = "The repository's GitHub Pages configuration. See [GitHub Pages Configuration](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#github-pages-configuration) for details."
  default     = null
}

variable "vulnerability_alerts" {
  type        = bool
  sensitive   = false
  description = "Set to true to enable security alerts for vulnerable dependencies. See [GitHub Documentation](https://help.github.com/en/github/managing-security-vulnerabilities/about-security-alerts-for-vulnerable-dependencies) for details"
  default     = false
}

variable "ignore_vulnerability_alerts_during_read" {
  type        = bool
  sensitive   = false
  description = "Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read"
  default     = false
}

variable "branch_default" {
  type        = string
  sensitive   = false
  description = "The default branch. Defaults to `main`"
  default     = "main"

  validation {
    condition     = length(regexall("^([[:alnum:]])", var.branch_default)) == 1
    error_message = "Branch names must begin with an alphanumeric character."
  }

  validation {
    condition     = flatten(regexall("^([[:alnum:]]+[\\w\\-]+?)$", var.branch_default))[0] == var.branch_default
    error_message = "Branch names must contain only the following valid characters: [0-9A-Za-z_\\-]."
  }

  validation {
    condition     = length(var.branch_default) > 0
    error_message = "Variable `branch_default` must have a value."
  }
}

variable "branches" {
  type        = list(string)
  sensitive   = false
  description = "Branches to configure for the repository"
  default     = ["main"]
}

variable "repository_default_branch" {
  type        = string
  sensitive   = false
  description = "GitHub and GitHub Enterprise organizations auto-initialize repositories with a default branch name. Default: `main`"
  default     = "main"

  validation {
    condition     = length(regexall("^([[:alnum:]])", var.repository_default_branch)) == 1
    error_message = "Branch names must begin with an alphanumeric character."
  }

  validation {
    condition     = flatten(regexall("^([[:alnum:]]+[\\w\\-]+?)$", var.repository_default_branch))[0] == var.repository_default_branch
    error_message = "Branch names must contain only the following valid characters: [0-9A-Za-z_\\-]."
  }

  validation {
    condition     = length(var.repository_default_branch) > 0
    error_message = "Variable `repository_default_branch` must have a value."
  }
}
