output "sns_topic_arn" {
  value       = aws_sns_topic.slack_sns_topic.arn
  description = "SNS topic ARN"
}

output "sns_topic_id" {
  value       = aws_sns_topic.slack_sns_topic.display_name
  description = "display name for the SNS topic"
}

output "aws_vpc_arn" {
  description = "AWS VPC ARN"
  value       = aws_vpc.main.arn
}

output "aws_vpc_id" {
  description = "AWS VPC ID"
  value       = aws_vpc.main.id
}

output "aws_subnet_arn" {
  description = "AWS subnet ARN"
  value       = aws_subnet.main.arn
}

output "aws_subnet_id" {
  value       = aws_subnet.main.id
  description = "AWS subnet ID"
}

output "aws_iam_role_arn" {
  value       = aws_iam_role.lambda_role.arn
  description = "AWS iam role ARN"
}

output "aws_iam_role_id" {
  value       = aws_iam_role.lambda_role.id
  description = "AWS iam role ID"
}

output "aws_iam_role_policy_id" {
  value       = aws_iam_role_policy.lambda_policy.id
  description = "AWS iam role policy id"
}

output "aws_lambda_layer_version_arn" {
  value       = aws_lambda_layer_version.requests_layer.arn
  description = "AWS Lambda layer version ARN"
}

output "aws_lambda_layer_version_id" {
  value       = aws_lambda_layer_version.requests_layer.id
  description = "AWS Lambda layer version ID"
}

output "aws_lambda_function_arn" {
  value       = aws_lambda_function.sns_lambda.arn
  description = "AWS Lambda function ARN"
}

output "aws_lambda_function_id" {
  value       = aws_lambda_function.sns_lambda.id
  description = "AWS Lambda function ID"
}

output "aws_sns_topic_arn" {
  value       = aws_sns_topic.slack_sns_topic.arn
  description = "AWS SNS topic ARN"
}

output "aws_sns_topic_id" {
  value       = aws_sns_topic.slack_sns_topic.id
  description = "AWS SNS topic ID"
}

output "aws_sns_topic_subscription_arn" {
  value       = aws_sns_topic.slack_sns_topic.arn
  description = "AWS SNS topic subscription ARN"
}

output "aws_sns_topic_subscription_id" {
  value       = aws_sns_topic_subscription.user_updates_sqs_target.arn
  description = "AWS SNS topic subscription ID"
}

output "aws_lambda_permission_id" {
  value       = aws_lambda_permission.with_sns.id
  description = "AWS Lambda permission ID"
}

output "policy_template" {
  value = aws_iam_role_policy.lambda_policy.id
}