# AWS terraform module to send Slack notifications

## Description

This is a terraform module to send Slack notifications using SNS and a Lambda function.
This module will deploy as core resources the following:

- SNS topic
- SNS Subscription
- Lambda Function

The SNS topic will receive messages, in example from a Cloudwatch metric, and will trigger the SNS subscription. The subscription will trigger the Lambda function. The function will use a Slack webhook to send messages to a channel using the Slack payload format, as described on "How to deploy and use this module".

The following data block will take the lambda python code (called slack_lambda_function.py) and will zip it in the "/output" path:

    data "archive_file" "zip_function" {
      type        = var.archive_file_type
      source_file = var.archive_file_source
      output_path = var.archive_file_output_path
    
    }

Then, the Lambda function will get that .zip file and will be deployed using that python code. If you need to do some change in the lambda code, just edit the slack_lambda_function file. Nothing else is needed.


![Image text](https://github.com/nicolasm3533/Nicolas_repo/blob/main/Slack_Lambda_diagram.jpg)

## Providers

Terraform: >= 1.2.1
AWS CLI: >= 2.4.16

## Usage
To install this module you should run:

```
terraform init
terraform apply
```
## How to deploy and use this module.

1. You can call the module using the GitHub URL: https://github.com/flugel-it/sikv3-aws-slack-notification

2. Specify all the required variables. You can also leave the default ones. The only external value would be the Slack webhook (slack_url).

3. Run terraform init, plan and apply.

4. Once the deployment finished, test it going to "slack_sns_topic" on the AWS console and click on "publish message".

5. Use the following message to try:

```json
{ 
  "Message" : "Random Message",
  "Title": "Test Title", 
  "Username": "Nicolas"
  }
```
  
6. You should get a message on your Slack channel with the values you included on step 5.

## Parameters or configuration

### Required

| Name  |  Default value  |  Type  |  Description  |
|----|----|----|----|
| role_name | "iam_role_for_lambda" | string | Iam role name for Lambda function.
| function_name | "slack_lambda_function" | string | Lambda function name |
| policy | no default value | string | policy file 
| assume_role_policy | no default value | string | assume role policy for Lambda 
| archive_file_type | zip | string | Lambda function file type
| archive_file_output_path | "outputs/slack-sqs-lambda-py" | string | path for unzipping the Lambda file
| layer_name | requests_layer | string | name for the Lambda layer
| sns_topic_name | slack_sns_topic | string | SNS topic name
| protocol_user_updates_sqs_target | "lambda" | string | protocol for sns topic subscription
| lambda_permission_action | lambda:InvokeFunction" | string | Permission action
| lambda_permission_principal | "sns.amazonaws.com" | string | Lambda principal
| slack_url | https://sample.url.com | string | Slack webhook

### Optional

| Name | Default value | Type | Description |
|----|----|----|----|
| cidr_block | 10.0.0.0/24 | string | CIDR block for creating the VPC |
| policy_name | slack_lambda_policy | string | Policy name
| role_name | iam_role_for_lambda | string | Role name for Lambda function
| archive_file_source | slack_lambda_function.py | string | Lambda function file
| archive_file_output_path | outputs/slack-sqs-lambda-py | string | Path for lambda function file
| layer_filename | requests_layer.zip | string | File name for the Lambda layer
| runtime | python3.9 | string | Runtime for the layer file
| lambda_filename | "slack-sqs-lambda-py" | string | Lambda function code file
| handler | "slack_lambda_function.lambda_handler" | string | Lambda function handler
| sns_topic_name | slack_sns_topic | string | SNS topic name
| kms_master_key_id | alias/aws/sns | string | Key for messages encryption
| aws_lambda_permission_statement_id | AllowExecutionFromSNS | string | Statement id for Lambda permission
| aws_lambda_permission_action | lambda:InvokeFunction | string | Lambda permission action
| tags | null | string | Default tags for all the resources in the module

## Outputs

| Name | Type | Description |
|----|----|----|
| sns_topic_arn | string | SNS topic ARN
| aws_iam_role_arn | string | AWS IAM role ARN
| aws_iam_role_id | string | AWS IAM role ID
| aws_iam_role_policy_id | string | AWS IAM role policy ID
| aws_lambda_function_arn | string | AWS Lambda function ARN
| aws_lambda_function_id | string | AWS Lambda function ID
| aws_lambda_layer_version_arn | string | AWS Lambda layer ARN
| aws_lambda_permission_id | string | AWS Lambda permission ID
| aws_sns_topic_arn | string | AWS SNS topic ARN
| aws_sns_topic_subscription_arn | string | AWS SNS topic subscription ARN
| aws_sns_topic_subscription_id | string | AWS SNS topic subscription ID
| aws_subnet_arn | string | AWS subnet ARN
| aws_subnet_id | string | AWS subnet ID
| aws_vpc_arn | string | AWS VPC ARN
| aws_vpc_id | string | AWS VPC ID
| policy_template | string | Policy template name 
