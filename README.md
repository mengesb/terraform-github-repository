# terraform-github-repository

Terraform module for creating GitHub repositories

## Requirements

- [terraform](https://www.terraform.io/downloads.html) > 0.12
- GitHub credentials

## Variables

| Variable | Type | Required | Default | Description |
| -------- | ---- | -------- | ------- | ----------- |
| name | string | yes |  | The name of the repository |
| description | string | no | `null` | A description of the repository |
| homepage_url | string | no | `null` | URL of a page description the project |
| private | bool | no | `false` | Set to true to create a private repository. Repositories are created as public (e.g. open source) by default |
| has_issues | bool | no | `false` | Set to true to enable the GitHub Issues features on the repository |
| has_projects | bool | no | `false` | Set to true to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error |
| has_wiki | bool | no | `false` | Set to true to enable the GitHub Wiki features on the repository |
| is_template | bool | no | `false` | Set to true to tell GitHub that this is a template repository |
| allow_merge_commit | bool | no | `true` | Set to false to disable merge commits on the repository |
| allow_squash_merge | bool | no | `true` | Set to false to disable squash merges on the repository |
| allow_rebase_merge | bool | no | `true` | Set to false to disable rebase merges on the repository |
| delete_branch_on_merge | bool | no | `false` | Automatically delete head branch after a pull request is merged. Defaults to false |
| has_downloads | bool | no | `false` | Set to true to enable the (deprecated) downloads features on the repository |
| auto_init | bool | no | `false` | Set to true to produce an initial commit in the repository |
| gitignore_template | string | no | `null` | Use the name of the template without the extension. For example, 'Haskell' |
| license_template | string | no | `null` | Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0' |
| archived | bool | no | `false` | Specifies if the repository should be archived. Defaults to false |
| topics | list(string) | no | `null` | The list of topics of the repository |
| template | object() | no | `null` | Supports two arguments: owner, template. Please see the [GitHub repository](https://www.terraform.io/docs/providers/github/r/repository.html#template-repositories) resource documentation for structure. |

## Examples

You'll find examples in the [examples/](examples) directory.

## Contributing & Testing

Please review the [CONTRIBUTING.md](CONTRIBUTING.md) file for recommendations

## License & Authors

**Author:** Brian Menges

```text
Copyright 2020 Brian Menges

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
