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
	expectedName := "terraform-provider-" + petname.Generate(2, "_")
	expectedOrg := os.Getenv("GITHUB_ORGANIZATION")

	expectedDirect := map[string]interface{}{
		"allow_merge_commit":     true,
		"allow_rebase_merge":     true,
		"allow_squash_merge":     true,
		"archived":               false,
		"auto_init":              false,
		"default_branch":         "main",
		"delete_branch_on_merge": false,
		"description":            "",
		"etag":                   "W/\"6e45944df2a14a0bd973f1e9d59b8fa7\"",
		"full_name":              expectedOrg + "/" + expectedName,
		"git_clone_url":          "git://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName + ".git",
		"gitignore_template":     nil,
		"has_downloads":          false,
		"has_issues":             false,
		"has_projects":           false,
		"has_wiki":               false,
		"homepage_url":           "",
		"html_url":               "https://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName,
		"http_clone_url":         "https://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName + ".git",
		"id":                     expectedName,
		"is_template":            false,
		"license_template":       nil,
		"name":                   expectedName,
		"node_id":                "MDEwOlJlcG9zaXRvcnk1NTI0",
		"private":                false,
		"ssh_clone_url":          "git@" + expectedFQDN + ":" + expectedOrg + "/" + expectedName + ".git",
		"svn_url":                "https://" + expectedFQDN + "/" + expectedOrg + "/" + expectedName,
		"template":               []map[string]interface{}{},
		"topics":                 nil,
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/single-example",
		VarFiles:     []string{"../../examples/fixtures/terraform.tfvars"},
		Vars: map[string]interface{}{
			"name": expectedName,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualDirect := terraform.OutputMapOfObjects(t, terraformOptions, "direct")
	actualName := terraform.Output(t, terraformOptions, "name")

	assert.Equal(t, expectedName, actualName)
	assert.Equal(t, expectedDirect["allow_merge_commit"], actualDirect["allow_merge_commit"])
	assert.Equal(t, expectedDirect["allow_rebase_merge"], actualDirect["allow_rebase_merge"])
	assert.Equal(t, expectedDirect["allow_squash_merge"], actualDirect["allow_squash_merge"])
	assert.Equal(t, expectedDirect["archived"], actualDirect["archived"])
	assert.Equal(t, expectedDirect["auto_init"], actualDirect["auto_init"])
	assert.Equal(t, expectedDirect["default_branch"], actualDirect["default_branch"])
	assert.Equal(t, expectedDirect["delete_branch_on_merge"], actualDirect["delete_branch_on_merge"])
	assert.Equal(t, expectedDirect["description"], actualDirect["description"])
	assert.Equal(t, expectedDirect["full_name"], actualDirect["full_name"])
	assert.Equal(t, expectedDirect["git_clone_url"], actualDirect["git_clone_url"])
	assert.Equal(t, expectedDirect["gitignore_template"], actualDirect["gitignore_template"])
	assert.Equal(t, expectedDirect["has_downloads"], actualDirect["has_downloads"])
	assert.Equal(t, expectedDirect["has_issues"], actualDirect["has_issues"])
	assert.Equal(t, expectedDirect["has_projects"], actualDirect["has_projects"])
	assert.Equal(t, expectedDirect["has_wiki"], actualDirect["has_wiki"])
	assert.Equal(t, expectedDirect["homepage_url"], actualDirect["homepage_url"])
	assert.Equal(t, expectedDirect["html_url"], actualDirect["html_url"])
	assert.Equal(t, expectedDirect["http_clone_url"], actualDirect["http_clone_url"])
	assert.Equal(t, expectedDirect["id"], actualDirect["id"])
	assert.Equal(t, expectedDirect["is_template"], actualDirect["is_template"])
	assert.Equal(t, expectedDirect["license_template"], actualDirect["license_template"])
	assert.Equal(t, expectedDirect["name"], actualDirect["name"])
	assert.Equal(t, expectedDirect["private"], actualDirect["private"])
	assert.Equal(t, expectedDirect["ssh_clone_url"], actualDirect["ssh_clone_url"])
	assert.Equal(t, expectedDirect["svn_url"], actualDirect["svn_url"])
	assert.Equal(t, expectedDirect["topics"], actualDirect["topics"])

}

func TestTerraformForEachExample(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/foreach-example",
		VarFiles:     []string{"../../examples/fixtures/terraform.tfvars"},
		NoColor:      true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	expectedOrg := os.Getenv("GITHUB_ORGANIZATION")
	expectedLen := 2

	out := terraform.OutputListOfObjects(t, terraformOptions, "repositories")

	require.Len(t, out, expectedLen, "Output should contain %d items", expectedLen)

	expectedTerraformExampleModule := map[string]interface{}{
		"allow_merge_commit":     true,
		"allow_rebase_merge":     true,
		"allow_squash_merge":     true,
		"archived":               false,
		"auto_init":              false,
		"default_branch":         "main",
		"delete_branch_on_merge": true,
		"description":            "",
		"etag":                   "W/\"6e45944df2a14a0bd973f1e9d59b8fa7\"",
		"full_name":              expectedOrg + "/terraform-example-module",
		"git_clone_url":          "git://github.com/" + expectedOrg + "/terraform-example-module.git",
		"gitignore_template":     nil,
		"has_downloads":          false,
		"has_issues":             false,
		"has_projects":           false,
		"has_wiki":               false,
		"homepage_url":           "",
		"html_url":               "https://github.com/" + expectedOrg + "/terraform-example-module",
		"http_clone_url":         "https://github.com/" + expectedOrg + "/terraform-example-module.git",
		"id":                     "terraform-example-module",
		"is_template":            false,
		"license_template":       nil,
		"name":                   "terraform-example-module",
		"node_id":                "MDEwOlJlcG9zaXRvcnk1NTI0",
		"private":                true,
		"ssh_clone_url":          "git@github.com:" + expectedOrg + "/terraform-example-module.git",
		"svn_url":                "https://github.com/" + expectedOrg + "/terraform-example-module",
		"template":               []map[string]interface{}{},
		"topics":                 nil,
	}

	expectedTerraformExamplePlan := map[string]interface{}{
		"allow_merge_commit":     true,
		"allow_rebase_merge":     true,
		"allow_squash_merge":     true,
		"archived":               false,
		"auto_init":              false,
		"default_branch":         "main",
		"delete_branch_on_merge": true,
		"description":            "",
		"etag":                   "W/\"6e45944df2a14a0bd973f1e9d59b8fa7\"",
		"full_name":              expectedOrg + "/tf_example_plan",
		"git_clone_url":          "git://github.com/" + expectedOrg + "/tf_example_plan.git",
		"gitignore_template":     nil,
		"has_downloads":          false,
		"has_issues":             false,
		"has_projects":           false,
		"has_wiki":               false,
		"homepage_url":           "",
		"html_url":               "https://github.com/" + expectedOrg + "/tf_example_plan",
		"http_clone_url":         "https://github.com/" + expectedOrg + "/tf_example_plan.git",
		"id":                     "tf_example_plan",
		"is_template":            false,
		"license_template":       nil,
		"name":                   "tf_example_plan",
		"node_id":                "MDEwOlJlcG9zaXRvcnk1NTI0",
		"private":                false,
		"ssh_clone_url":          "git@github.com:" + expectedOrg + "/tf_example_plan.git",
		"svn_url":                "https://github.com/" + expectedOrg + "/tf_example_plan",
		"template":               []map[string]interface{}{},
		"topics":                 nil,
	}

	assert.Equal(t, expectedTerraformExampleModule["allow_merge_commit"], out[0]["allow_merge_commit"])
	assert.Equal(t, expectedTerraformExampleModule["allow_rebase_merge"], out[0]["allow_rebase_merge"])
	assert.Equal(t, expectedTerraformExampleModule["allow_squash_merge"], out[0]["allow_squash_merge"])
	assert.Equal(t, expectedTerraformExampleModule["archived"], out[0]["archived"])
	assert.Equal(t, expectedTerraformExampleModule["auto_init"], out[0]["auto_init"])
	assert.Equal(t, expectedTerraformExampleModule["default_branch"], out[0]["default_branch"])
	assert.Equal(t, expectedTerraformExampleModule["delete_branch_on_merge"], out[0]["delete_branch_on_merge"])
	assert.Equal(t, expectedTerraformExampleModule["description"], out[0]["description"])
	assert.Equal(t, expectedTerraformExampleModule["full_name"], out[0]["full_name"])
	assert.Equal(t, expectedTerraformExampleModule["git_clone_url"], out[0]["git_clone_url"])
	assert.Equal(t, expectedTerraformExampleModule["gitignore_template"], out[0]["gitignore_template"])
	assert.Equal(t, expectedTerraformExampleModule["has_downloads"], out[0]["has_downloads"])
	assert.Equal(t, expectedTerraformExampleModule["has_issues"], out[0]["has_issues"])
	assert.Equal(t, expectedTerraformExampleModule["has_projects"], out[0]["has_projects"])
	assert.Equal(t, expectedTerraformExampleModule["has_wiki"], out[0]["has_wiki"])
	assert.Equal(t, expectedTerraformExampleModule["homepage_url"], out[0]["homepage_url"])
	assert.Equal(t, expectedTerraformExampleModule["html_url"], out[0]["html_url"])
	assert.Equal(t, expectedTerraformExampleModule["http_clone_url"], out[0]["http_clone_url"])
	assert.Equal(t, expectedTerraformExampleModule["id"], out[0]["id"])
	assert.Equal(t, expectedTerraformExampleModule["is_template"], out[0]["is_template"])
	assert.Equal(t, expectedTerraformExampleModule["license_template"], out[0]["license_template"])
	assert.Equal(t, expectedTerraformExampleModule["name"], out[0]["name"])
	assert.Equal(t, expectedTerraformExampleModule["private"], out[0]["private"])
	assert.Equal(t, expectedTerraformExampleModule["ssh_clone_url"], out[0]["ssh_clone_url"])
	assert.Equal(t, expectedTerraformExampleModule["svn_url"], out[0]["svn_url"])
	assert.Equal(t, expectedTerraformExampleModule["topics"], out[0]["topics"])
	assert.Equal(t, expectedTerraformExamplePlan["allow_merge_commit"], out[1]["allow_merge_commit"])
	assert.Equal(t, expectedTerraformExamplePlan["allow_rebase_merge"], out[1]["allow_rebase_merge"])
	assert.Equal(t, expectedTerraformExamplePlan["allow_squash_merge"], out[1]["allow_squash_merge"])
	assert.Equal(t, expectedTerraformExamplePlan["archived"], out[1]["archived"])
	assert.Equal(t, expectedTerraformExamplePlan["auto_init"], out[1]["auto_init"])
	assert.Equal(t, expectedTerraformExamplePlan["default_branch"], out[1]["default_branch"])
	assert.Equal(t, expectedTerraformExamplePlan["delete_branch_on_merge"], out[1]["delete_branch_on_merge"])
	assert.Equal(t, expectedTerraformExamplePlan["description"], out[1]["description"])
	assert.Equal(t, expectedTerraformExamplePlan["full_name"], out[1]["full_name"])
	assert.Equal(t, expectedTerraformExamplePlan["git_clone_url"], out[1]["git_clone_url"])
	assert.Equal(t, expectedTerraformExamplePlan["gitignore_template"], out[1]["gitignore_template"])
	assert.Equal(t, expectedTerraformExamplePlan["has_downloads"], out[1]["has_downloads"])
	assert.Equal(t, expectedTerraformExamplePlan["has_issues"], out[1]["has_issues"])
	assert.Equal(t, expectedTerraformExamplePlan["has_projects"], out[1]["has_projects"])
	assert.Equal(t, expectedTerraformExamplePlan["has_wiki"], out[1]["has_wiki"])
	assert.Equal(t, expectedTerraformExamplePlan["homepage_url"], out[1]["homepage_url"])
	assert.Equal(t, expectedTerraformExamplePlan["html_url"], out[1]["html_url"])
	assert.Equal(t, expectedTerraformExamplePlan["http_clone_url"], out[1]["http_clone_url"])
	assert.Equal(t, expectedTerraformExamplePlan["id"], out[1]["id"])
	assert.Equal(t, expectedTerraformExamplePlan["is_template"], out[1]["is_template"])
	assert.Equal(t, expectedTerraformExamplePlan["license_template"], out[1]["license_template"])
	assert.Equal(t, expectedTerraformExamplePlan["name"], out[1]["name"])
	assert.Equal(t, expectedTerraformExamplePlan["private"], out[1]["private"])
	assert.Equal(t, expectedTerraformExamplePlan["ssh_clone_url"], out[1]["ssh_clone_url"])
	assert.Equal(t, expectedTerraformExamplePlan["svn_url"], out[1]["svn_url"])
	assert.Equal(t, expectedTerraformExamplePlan["topics"], out[1]["topics"])
}

/*
# TODO: Add tests or template repository
func TestTerraformTemplateExample(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	expectedName := "terraform-" + petname.Generate(2, "-")
	expectedOrg := os.Getenv("GITHUB_ORGANIZATION")

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
