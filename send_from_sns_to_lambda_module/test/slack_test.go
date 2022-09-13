package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

var aws_access_key_id, aws_secret_access_key string

func init() {
	aws_access_key_id = os.Getenv("AWS_ACCESS_KEY_ID")
	aws_secret_access_key = os.Getenv("AWS_SECRET_ACCESS_KEY")

	if aws_access_key_id == "" {
		panic("Please set a aws_access_key_id using the AWS_ACCESS_KEY_ID environment variable.")
	}

	if aws_secret_access_key == "" {
		panic("Please set a aws_secret_access_key using the AWS_SECRET_ACCESS_KEY environment variable.")
	}
}

func TestMain(t *testing.T) {

	slack_url := "https://hooks.slack.com/services/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"

	// attach_policy := "false"

	t.Parallel()

	terraformOptions := &terraform.Options{
		// Source path of Terraform directory.
		TerraformDir: "../",

		Vars: map[string]interface{}{

			"slack_url": slack_url,
			//"attach_policy": attach_policy,
		},
	}

	// To clean up any resources that have been created, run 'terraform destroy' towards the end of the test
	defer terraform.Destroy(t, terraformOptions)

	/// This will run 'terraform init' and 'terraform application' and will fail the test if any errors occur
	terraform.InitAndApply(t, terraformOptions)

	// To get the value of an output variable, run 'terraform output'
	//Arn := terraform.Output(t, terraformOptions, "workspace_arn")
}
