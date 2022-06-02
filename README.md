<!-- BEGIN_TF_DOCS -->
<!-- markdownlint-disable MD024 MD033 -->
# terraform-github-repository

Terraform module for creating GitHub repositories

## Experimental features

This module uses the [experimental feature optional object type attributes](https://www.terraform.io/language/expressions/type-constraints#experimental-optional-object-type-attributes)

## Additional information

This module outputs attributes from the `github_repository` resource **and** data source. Because this module allows you to `auto_init` a repository and set a different `branch_default` than `main`, the resource is out of date from reality. For this reason, when the data source can provide the most up to date information on a repository attribute it will be used, and in cases where the data source doesn't provide the attribute value, the resource will be used.

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.1)

- <a name="requirement_github"></a> [github](#requirement\_github) (~> 4.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the repository

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge)

Description: Set to true to allow auto-merging pull requests on the repository

Type: `bool`

Default: `false`

### <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit)

Description: Set to false to disable merge commits on the repository

Type: `bool`

Default: `true`

### <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge)

Description: Set to false to disable rebase merges on the repository

Type: `bool`

Default: `true`

### <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge)

Description: Set to false to disable squash merges on the repository

Type: `bool`

Default: `true`

### <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy)

Description: Set to true to archive the repository instead of deleting on destroy

Type: `bool`

Default: `false`

### <a name="input_archived"></a> [archived](#input\_archived)

Description: Specifies if the repository should be archived. Defaults to false

Type: `bool`

Default: `false`

### <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init)

Description: Set to true to produce an initial commit in the repository

Type: `bool`

Default: `false`

### <a name="input_branch_default"></a> [branch\_default](#input\_branch\_default)

Description: The branch. Defaults to main

Type: `string`

Default: `"main"`

### <a name="input_branches"></a> [branches](#input\_branches)

Description: Branches to configure for the repository

Type: `list(string)`

Default:

```json
[
  "main"
]
```

### <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge)

Description: Automatically delete head branch after a pull request is merged. Defaults to false

Type: `bool`

Default: `false`

### <a name="input_description"></a> [description](#input\_description)

Description: A description of the repository

Type: `string`

Default: `null`

### <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template)

Description: Use the name of the template without the extension. For example, 'Haskell'

Type: `string`

Default: `null`

### <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads)

Description: Set to true to enable the (deprecated) downloads features on the repository

Type: `bool`

Default: `false`

### <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues)

Description: Set to true to enable the GitHub Issues features on the repository

Type: `bool`

Default: `false`

### <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects)

Description: Set to true to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error

Type: `bool`

Default: `false`

### <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki)

Description: Set to true to enable the GitHub Wiki features on the repository

Type: `bool`

Default: `false`

### <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url)

Description: URL of a page description the project

Type: `string`

Default: `null`

### <a name="input_ignore_vulnerability_alerts_during_read"></a> [ignore\_vulnerability\_alerts\_during\_read](#input\_ignore\_vulnerability\_alerts\_during\_read)

Description: Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read

Type: `bool`

Default: `false`

### <a name="input_is_template"></a> [is\_template](#input\_is\_template)

Description: Set to true to tell GitHub that this is a template repository

Type: `bool`

Default: `false`

### <a name="input_license_template"></a> [license\_template](#input\_license\_template)

Description: Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'

Type: `string`

Default: `null`

### <a name="input_pages"></a> [pages](#input\_pages)

Description: The repository's GitHub Pages configuration. See [GitHub Pages Configuration](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#github-pages-configuration) for details.

Type:

```hcl
object(
    {
      branch = string           # The repository branch used to publish the site's source files
      path   = optional(string) # The repository directory from which the site publishes
    }
  )
```

Default: `null`

### <a name="input_template"></a> [template](#input\_template)

Description: Use a template repository to create this resource. See [Template Repositories](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#template-repositories) for details.

Type:

```hcl
object(
    {
      owner      = string # The GitHub organization or user the template repository is owned by
      repository = string # The name of the template repository
    }
  )
```

Default: `null`

### <a name="input_topics"></a> [topics](#input\_topics)

Description: The list of topics of the repository

Type: `list(string)`

Default: `null`

### <a name="input_visibility"></a> [visibility](#input\_visibility)

Description: Can be public or private. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be internal.

Type: `string`

Default: `"public"`

### <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts)

Description: Set to true to enable security alerts for vulnerable dependencies. See [GitHub Documentation](https://help.github.com/en/github/managing-security-vulnerabilities/about-security-alerts-for-vulnerable-dependencies) for details

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_allow_auto_merge"></a> [allow\_auto\_merge](#output\_allow\_auto\_merge)

Description: Repository auto merge value

### <a name="output_allow_merge_commit"></a> [allow\_merge\_commit](#output\_allow\_merge\_commit)

Description: Repository merge commit value

### <a name="output_allow_rebase_merge"></a> [allow\_rebase\_merge](#output\_allow\_rebase\_merge)

Description: Repository rebase merge value

### <a name="output_allow_squash_merge"></a> [allow\_squash\_merge](#output\_allow\_squash\_merge)

Description: Repository squash merge value

### <a name="output_archive_on_destroy"></a> [archive\_on\_destroy](#output\_archive\_on\_destroy)

Description: Archive repository on destruction

### <a name="output_archived"></a> [archived](#output\_archived)

Description: Repository is archied

### <a name="output_auto_init"></a> [auto\_init](#output\_auto\_init)

Description: Auto initialize repository

### <a name="output_branches"></a> [branches](#output\_branches)

Description: Repository branches

### <a name="output_default_branch"></a> [default\_branch](#output\_default\_branch)

Description: Repository default branch

### <a name="output_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#output\_delete\_branch\_on\_merge)

Description: Repository delete branch on merge value

### <a name="output_description"></a> [description](#output\_description)

Description: Repository description

### <a name="output_full_name"></a> [full\_name](#output\_full\_name)

Description: Repository full name

### <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url)

Description: Repository git clone URL

### <a name="output_gitignore_template"></a> [gitignore\_template](#output\_gitignore\_template)

Description: Repository gitignore template

### <a name="output_has_downloads"></a> [has\_downloads](#output\_has\_downloads)

Description: Repository download feature value

### <a name="output_has_issues"></a> [has\_issues](#output\_has\_issues)

Description: Repository issues feature value

### <a name="output_has_projects"></a> [has\_projects](#output\_has\_projects)

Description: Repository projects feature value

### <a name="output_has_wiki"></a> [has\_wiki](#output\_has\_wiki)

Description: Repository wiki feature value

### <a name="output_homepage_url"></a> [homepage\_url](#output\_homepage\_url)

Description: Repository homepage URL

### <a name="output_html_url"></a> [html\_url](#output\_html\_url)

Description: Repository HTML URL

### <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url)

Description: Repository HTTP clone URL

### <a name="output_id"></a> [id](#output\_id)

Description: Repository ID

### <a name="output_ignore_vulnerability_alerts_during_read"></a> [ignore\_vulnerability\_alerts\_during\_read](#output\_ignore\_vulnerability\_alerts\_during\_read)

Description: Repository ignore vulnerability alerts during read value

### <a name="output_is_template"></a> [is\_template](#output\_is\_template)

Description: Repository template value

### <a name="output_license_template"></a> [license\_template](#output\_license\_template)

Description: Repository license template value

### <a name="output_name"></a> [name](#output\_name)

Description: Repository name

### <a name="output_node_id"></a> [node\_id](#output\_node\_id)

Description: Repository node ID

### <a name="output_pages"></a> [pages](#output\_pages)

Description: Repository pages value

### <a name="output_repo_id"></a> [repo\_id](#output\_repo\_id)

Description: Repository ID

### <a name="output_repository"></a> [repository](#output\_repository)

Description: Full repository object from data source

### <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url)

Description: Repository SSH clone URL

### <a name="output_svn_url"></a> [svn\_url](#output\_svn\_url)

Description: Repository SVN URL

### <a name="output_template"></a> [template](#output\_template)

Description: Repository template value

### <a name="output_topics"></a> [topics](#output\_topics)

Description: Repository topics

### <a name="output_visibility"></a> [visibility](#output\_visibility)

Description: Repository visibility (replaces `private`)

### <a name="output_vulnerability_alerts"></a> [vulnerability\_alerts](#output\_vulnerability\_alerts)

Description: Repository vulnerability alerts

## Contributing

Contributions are always welcome. Please consult our [CONTRIBUTING.md](CONTRIBUTING.md) file for more information on how to submit quality contributions.

## License & Authors

Author: Brian Menges (@mengesb)

```text
   Copyright 2022 Brian Menges

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
```
<!-- END_TF_DOCS -->
