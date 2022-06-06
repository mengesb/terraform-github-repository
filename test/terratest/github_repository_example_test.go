package test

import (
	"math/rand"
	"os"
	"testing"
	"time"

	petname "github.com/dustinkirkland/golang-petname"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// Test terraform-github-repository module using examples/single-example using Terratest.
func TestTerraformSingleExample(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	expectedFQDN := "github.com"
	expectedName := "terraform-provider-singlemodule" + petname.Generate(2, "_")
	expectedOrg := os.Getenv("GITHUB_OWNER")

	expectedOutputs := map[string]interface{}{
		"allow_auto_merge":       false,
		"allow_merge_commit":     true,
		"allow_rebase_merge":     true,
		"allow_squash_merge":     true,
		"archive_on_destroy":     false,
		"archived":               false,
		"auto_init":              false,
		"branches":               []interface{}{},
		"default_branch":         "main",
		"delete_branch_on_merge": false,
		"description":            nil,
		"etag":                   "W/\"6e45944df2a14a0bd973f1e9d59b8fa7\"",
		"full_name":              expectedOrg + "/" + expectedName,
		"gitignore_template":     nil,
		"git_clone_url":          "git://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName + ".git",
		"has_downloads":          false,
		"has_issues":             false,
		"has_projects":           false,
		"has_wiki":               false,
		"homepage_url":           nil,
		"html_url":               "https://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName,
		"http_clone_url":         "https://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName + ".git",
		"id":                     expectedName,
		"is_template":            false,
		"license_template":       nil,
		"name":                   expectedName,
		"node_id":                "MDEwOlJlcG9zaXRvcnk1NTI0",
		"pages":                  []interface{}{},
		"repo_id":                1234567890,
		"ssh_clone_url":          "git@" + expectedFQDN + ":" + expectedOrg + "/" + expectedName + ".git",
		"svn_url":                "https://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName,
		"template":               []interface{}{},
		"topics":                 []interface{}{},
		"visibility":             "public",
		"vulnerability_alerts":   false,
		"ignore_vulnerability_alerts_during_read": false,
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/single-example",
		//VarFiles:     []string{"../../examples/fixtures/terraform.tfvars"},
		Vars: map[string]interface{}{
			"name": expectedName,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualOutputs := terraform.OutputAll(t, terraformOptions)

	// Run `terraform output` to get the values of output variables

	assert.Equal(t, expectedOutputs["allow_auto_merge"], actualOutputs["allow_auto_merge"].(bool))
	assert.Equal(t, expectedOutputs["allow_merge_commit"], actualOutputs["allow_merge_commit"].(bool))
	assert.Equal(t, expectedOutputs["allow_rebase_merge"], actualOutputs["allow_rebase_merge"].(bool))
	assert.Equal(t, expectedOutputs["allow_squash_merge"], actualOutputs["allow_squash_merge"].(bool))
	assert.Equal(t, expectedOutputs["archive_on_destroy"], actualOutputs["archive_on_destroy"].(bool))
	assert.Equal(t, expectedOutputs["archived"], actualOutputs["archived"].(bool))
	assert.Equal(t, expectedOutputs["auto_init"], actualOutputs["auto_init"].(bool))
	assert.Equal(t, expectedOutputs["branches"], actualOutputs["branches"])
	assert.Equal(t, expectedOutputs["default_branch"], actualOutputs["default_branch"].(string))
	assert.Equal(t, expectedOutputs["delete_branch_on_merge"], actualOutputs["delete_branch_on_merge"].(bool))
	assert.Equal(t, expectedOutputs["description"], actualOutputs["description"])
	assert.Equal(t, expectedOutputs["full_name"], actualOutputs["full_name"].(string))
	assert.Equal(t, expectedOutputs["gitignore_template"], actualOutputs["gitignore_template"])
	assert.Equal(t, expectedOutputs["git_clone_url"], actualOutputs["git_clone_url"].(string))
	assert.Equal(t, expectedOutputs["has_downloads"], actualOutputs["has_downloads"].(bool))
	assert.Equal(t, expectedOutputs["has_issues"], actualOutputs["has_issues"].(bool))
	assert.Equal(t, expectedOutputs["has_projects"], actualOutputs["has_projects"].(bool))
	assert.Equal(t, expectedOutputs["has_wiki"], actualOutputs["has_wiki"].(bool))
	assert.Equal(t, expectedOutputs["homepage_url"], actualOutputs["homepage_url"])
	assert.Equal(t, expectedOutputs["html_url"], actualOutputs["html_url"].(string))
	assert.Equal(t, expectedOutputs["http_clone_url"], actualOutputs["http_clone_url"].(string))
	assert.Equal(t, expectedOutputs["id"], actualOutputs["id"].(string))
	assert.Equal(t, expectedOutputs["is_template"], actualOutputs["is_template"].(bool))
	assert.Equal(t, expectedOutputs["license_template"], actualOutputs["license_template"])
	assert.Equal(t, expectedOutputs["name"], actualOutputs["name"].(string))
	//assert.Equal(t, expectedOutputs["node_id"], actualOutputs["node_id"].(string))
	assert.Equal(t, expectedOutputs["pages"], actualOutputs["pages"])
	//assert.Equal(t, expectedOutputs["repo_id"], actualOutputs["repo_id"].(string))
	assert.Equal(t, expectedOutputs["ssh_clone_url"], actualOutputs["ssh_clone_url"].(string))
	assert.Equal(t, expectedOutputs["template"], actualOutputs["template"])
	assert.Equal(t, expectedOutputs["topics"], actualOutputs["topics"])
	assert.Equal(t, expectedOutputs["visibility"], actualOutputs["visibility"].(string))
	assert.Equal(t, expectedOutputs["vulnerability_alerts"], actualOutputs["vulnerability_alerts"].(bool))
	assert.Equal(t, expectedOutputs["ignore_vulnerability_alerts_during_read"], actualOutputs["ignore_vulnerability_alerts_during_read"].(bool))
}

func TestTerraformForEachExample(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	expectedOrg := os.Getenv("GITHUB_OWNER")

	expectedOutputsModule := map[string]interface{}{
		"default_branch":         "main",
		"delete_branch_on_merge": true,
		"full_name":              expectedOrg + "/terraform-example-module",
		"name":                   "terraform-example-module",
		"visibility":             "private",
	}

	expectedOutputsPlan := map[string]interface{}{
		"default_branch":         "main",
		"delete_branch_on_merge": true,
		"full_name":              expectedOrg + "/tf_example_plan",
		"name":                   "tf_example_plan",
		"visibility":             "public",
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/foreach-example",
		//VarFiles:     []string{"../../examples/fixtures/terraform.tfvars"},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualOutputs := terraform.OutputListOfObjects(t, terraformOptions, "repositories")
	expectedLen := 2

	require.Len(t, actualOutputs, expectedLen, "Output should contain %d items", expectedLen)

	// First repository created
	assert.Equal(t, expectedOutputsModule["default_branch"], actualOutputs[0]["default_branch"].(string))
	assert.Equal(t, expectedOutputsModule["delete_branch_on_merge"], actualOutputs[0]["delete_branch_on_merge"].(bool))
	assert.Equal(t, expectedOutputsModule["full_name"], actualOutputs[0]["full_name"].(string))
	assert.Equal(t, expectedOutputsModule["name"], actualOutputs[0]["name"].(string))
	assert.Equal(t, expectedOutputsModule["visibility"], actualOutputs[0]["visibility"].(string))

	// Second repository created
	assert.Equal(t, expectedOutputsPlan["default_branch"], actualOutputs[1]["default_branch"].(string))
	assert.Equal(t, expectedOutputsPlan["delete_branch_on_merge"], actualOutputs[1]["delete_branch_on_merge"].(bool))
	assert.Equal(t, expectedOutputsPlan["full_name"], actualOutputs[1]["full_name"].(string))
	assert.Equal(t, expectedOutputsPlan["name"], actualOutputs[1]["name"].(string))
	assert.Equal(t, expectedOutputsPlan["visibility"], actualOutputs[1]["visibility"].(string))
}

func TestTerraformBranchExample(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	expectedName := "terraform-provider-branchmodule" + petname.Generate(2, "_")

	expectedOutputs := map[string]interface{}{
		"auto_init":              true,
		"default_branch":         "production",
		"delete_branch_on_merge": true,
		"name":                   expectedName,
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/branch-example",
		//VarFiles:     []string{"../../examples/fixtures/terraform.tfvars"},
		Vars: map[string]interface{}{
			"name": expectedName,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualOutputs := terraform.OutputAll(t, terraformOptions)

	assert.Equal(t, expectedOutputs["auto_init"], actualOutputs["auto_init"].(bool))
	assert.Equal(t, expectedOutputs["default_branch"], actualOutputs["default_branch"].(string))
	assert.Equal(t, expectedOutputs["delete_branch_on_merge"], actualOutputs["delete_branch_on_merge"].(bool))
	assert.Equal(t, expectedOutputs["name"], actualOutputs["name"].(string))
}

/*
# TODO: Add tests or template repository
func TestTerraformTemplateExample(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	expectedName := "terraform-" + petname.Generate(2, "-")
	expectedOrg := os.Getenv("GITHUB_OWNER")

	expectedTmp := map[string]interface{}{
		"full_name": expectedOrg + "/" + expectedName,
		"id":        expectedName,
		"name":      expectedName,
		"template": []map[string]interface{}{
			{
				"owner":      "mengesb",
				"repository": "template-terraform-module",
			},
		},
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/template-example",
		VarFiles:     []string{"../../examples/fixtures/terraform.tfvars"},
		Vars: map[string]interface{}{
			"name": expectedName,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualTmp := terraform.OutputMapOfObjects(t, terraformOptions, "tmp")

	assert.Equal(t, expectedTmp["full_name"], actualTmp["full_name"])
	assert.Equal(t, expectedTmp["id"], actualTmp["id"])
	assert.Equal(t, expectedTmp["name"], actualTmp["name"])
	assert.Equal(t, expectedTmp["template"], actualTmp["template"])
}
*/
