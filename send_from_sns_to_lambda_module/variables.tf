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
  default     = "slack_lambda_function.lambda_handler"
  description = "Handler for Lambda Function"
  type        = string
}

variable "sns_topic_name" {

  description = "SNS topic name"
  default     = "slack_sns_topic"
  type        = string
}

variable "slack_url" {
  description = "Webhook URL"
  default     = "https://sample.url.com"
  sensitive   = true
  type        = string
}

variable "runtime" {
  description = "compatible runtime"
  default     = "python3.9"
  type        = string
}

variable "layer_name" {
  default     = "requests_layer"
  description = "Lambda function layer name"
  type        = string
}

variable "layer_filename" {
  description = "layer filename"
  default     = "requests_layer.zip"
  type        = string
}

variable "protocol_user_updates_sqs_target" {
  default     = "lambda"
  description = "SQS protocol"
  type        = string
}

variable "archive_file_type" {
  default     = "zip"
  description = "Archive file type"
  type        = string
}

variable "archive_file_source" {
  default     = "slack_lambda_function.py"
  description = "Archive file source"
  type        = string
}

variable "archive_file_output_path" {
  default     = "outputs/slack-sqs-lambda-py"
  description = "Output path for unzipping the archive file"
  type        = string

}

variable "aws_lambda_permission_statement_id" {
  default     = "AllowExecutionFromSNS"
  description = "Statement ID for the lambda permission policy"
  type        = string
}

variable "aws_lambda_permission_action" {
  default     = "lambda:InvokeFunction"
  description = "Lambda permission action"
  type        = string

}

variable "aws_lambda_permission_principal" {
  default     = "sns.amazonaws.com"
  description = "Lambda permission principal"
  type        = string
}

variable "kms_master_key_id" {
  default     = "alias/aws/sns"
  description = "Key ID for encrypting SNS messages"
  type        = string
}


