# Tests

This folder contains automated tests for this Module. All of the tests are written in [Go](https://golang.org/). Most of these are "integration tests" that deploy real infrastructure using Terraform and verify that infrastructure works as expected using a helper library called [Terratest](https://github.com/gruntwork-io/terratest).  

## WARNING WARNING WARNING

**Note #1**: These tests create real resources within the provider used, so your access credentials must be have permissions required for all operations.

**Note #2**: Never forcefully shut the tests down (e.g. by hitting `CTRL + C`) or the cleanup tasks won't run!

**Note #3**: These tests often complete within about 30s, however we set `-timeout 2m` on all tests not because they necessarily take that long, but because Go has a default test timeout of 10 minutes, after which it forcefully kills the tests with a `SIGQUIT`, preventing the cleanup tasks from running.

## Running the tests

### Prerequisites

- Install the latest version of [Go](https://golang.org/).
- Install [Terraform](https://www.terraform.io/downloads.html).
- Configure your GitHub Enterprise credentials by creating a `terraform.tfvars`
  file in the `test/fixtures` path. This file *SHOULD NOT BE COMMITTED!!*

### Run all the tests

```bash
cd test
go test -v -timeout 2m
```

### Run a specific test

To run a specific test called `TestFoo`:

```bash
cd test
go test -v -timeout 2m -run TestFoo
```
