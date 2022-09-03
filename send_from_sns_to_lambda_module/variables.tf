variable "cidr_block" {
  description = "cidr block for vpc"
  default     = "10.0.0.0/24"
}

variable "policy_name" {
  description = "policy name for lambda role"
  default     = "slack_lambda_policy"
}

variable "role_name" {
  description = "role name for lambda function"
  default     = "iam_role_for_lambda"
}

variable "function_name" {
  description = "lambda function name"
  default     = "slack_lambda_function"
}

variable "lambda_filename" {
  description = "lambda file name"
  default     = "outputs/slack-sqs-lambda-py"
}

variable "handler" {
  default = "slack_lambda_function.lambda_handler"
}

variable "sns_topic_name" {

  description = "SNS topic name"
  default     = "slack_sns_topic"
}

variable "slack_url" {
  description = "Webhook URL"
  default     = "https://sample.url.com"
  sensitive   = true
}

variable "runtime" {
  description = "compatible runtime"
  default     = "python3.9"
}

variable "layer_name" {
  default = "requests_layer"
}

variable "layer_filename" {
  description = "layer filename"
  default     = "requests_layer.zip"
}

variable "protocol_user_updates_sqs_target" {
  default = "lambda"
}

variable "archive_file_type" {
  default = "zip"
}

variable "archive_file_source" {
  default = "slack_lambda_function.py"
}

variable "archive_file_output_path" {
  default = "outputs/slack-sqs-lambda-py"

}

variable "aws_lambda_permission_statement_id" {
  default = "AllowExecutionFromSNS"
}

variable "aws_lambda_permission_action" {
  default = "lambda:InvokeFunction"

}

variable "aws_lambda_permission_principal" {
  default = "sns.amazonaws.com"
}

variable "kms_master_key_id" {
  default = "alias/aws/sns"

}


