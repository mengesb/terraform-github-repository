#
# Terraform:: examples/single-example
# Plan:: outputs.tf
#

output "allow_auto_merge" {
  value       = module.r.allow_auto_merge
  sensitive   = false
  description = "Repository auto merge value"
}

output "allow_merge_commit" {
  value       = module.r.allow_merge_commit
  sensitive   = false
  description = "Repository merge commit value"
}

output "allow_rebase_merge" {
  value       = module.r.allow_rebase_merge
  sensitive   = false
  description = "Repository rebase merge value"
}

output "allow_squash_merge" {
  value       = module.r.allow_squash_merge
  sensitive   = false
  description = "Repository squash merge value"
}

output "archived" {
  value       = module.r.archived
  sensitive   = false
  description = "Repository is archied"
}

output "archive_on_destroy" {
  value       = module.r.archive_on_destroy
  sensitive   = false
  description = "Archive repository on destruction"
}

output "auto_init" {
  value       = module.r.auto_init
  sensitive   = false
  description = "Auto initialize repository"
}

output "branches" {
  value       = module.r.branches
  sensitive   = false
  description = "Repository branches"
}

output "default_branch" {
  value       = module.r.default_branch
  sensitive   = false
  description = "Repository default branch"
}

output "delete_branch_on_merge" {
  value       = module.r.delete_branch_on_merge
  sensitive   = false
  description = "Repository delete branch on merge value"
}

output "description" {
  value       = module.r.description
  sensitive   = false
  description = "Repository description"
}

output "full_name" {
  value       = module.r.full_name
  sensitive   = false
  description = "Repository full name"
}

output "gitignore_template" {
  value       = module.r.gitignore_template
  sensitive   = false
  description = "Repository gitignore template"
}

output "git_clone_url" {
  value       = module.r.git_clone_url
  sensitive   = false
  description = "Repository git clone URL"
}

output "has_downloads" {
  value       = module.r.has_downloads
  sensitive   = false
  description = "Repository download feature value"
}

output "has_issues" {
  value       = module.r.has_issues
  sensitive   = false
  description = "Repository issues feature value"
}

output "has_projects" {
  value       = module.r.has_projects
  sensitive   = false
  description = "Repository projects feature value"
}

output "has_wiki" {
  value       = module.r.has_wiki
  sensitive   = false
  description = "Repository wiki feature value"
}

output "homepage_url" {
  value       = module.r.homepage_url
  sensitive   = false
  description = "Repository homepage URL"
}

output "html_url" {
  value       = module.r.html_url
  sensitive   = false
  description = "Repository HTML URL"
}

output "http_clone_url" {
  value       = module.r.http_clone_url
  sensitive   = false
  description = "Repository HTTP clone URL"
}

output "id" {
  value       = module.r.id
  sensitive   = false
  description = "Repository ID"
}

output "is_template" {
  value       = module.r.is_template
  sensitive   = false
  description = "Repository template value"
}

output "license_template" {
  value       = module.r.license_template
  sensitive   = false
  description = "Repository license template value"
}

output "name" {
  value       = module.r.name
  sensitive   = false
  description = "Repository name"
}

output "node_id" {
  value       = module.r.node_id
  sensitive   = false
  description = "Repository node ID"
}

output "pages" {
  value       = module.r.pages
  sensitive   = false
  description = "Repository pages value"
}

output "repo_id" {
  value       = module.r.repo_id
  sensitive   = false
  description = "Repository ID"
}

output "ssh_clone_url" {
  value       = module.r.ssh_clone_url
  sensitive   = false
  description = "Repository SSH clone URL"
}

output "svn_url" {
  value       = module.r.svn_url
  sensitive   = false
  description = "Repository SVN URL"
}

output "template" {
  value       = module.r.template
  sensitive   = false
  description = "Repository template value"
}

output "topics" {
  value       = module.r.topics
  sensitive   = false
  description = "Repository topics"
}

output "visibility" {
  value       = module.r.visibility
  sensitive   = false
  description = "Repository visibility (replaces `private`)"
}

output "vulnerability_alerts" {
  value       = module.r.vulnerability_alerts
  sensitive   = false
  description = "Repository vulnerability alerts"
}

output "ignore_vulnerability_alerts_during_read" {
  value       = module.r.ignore_vulnerability_alerts_during_read
  sensitive   = false
  description = "Repository ignore vulnerability alerts during read value"
}

output "repository" {
  value       = module.r
  sensitive   = false
  description = "Full repository object from data source"
}
