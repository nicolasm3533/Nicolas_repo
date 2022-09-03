resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block
}


resource "aws_iam_role_policy" "lambda_policy" {
  name   = var.policy_name
  role   = aws_iam_role.lambda_role.name
  policy = file("policy.json")
}

resource "aws_iam_role" "lambda_role" {
  name               = var.role_name
  assume_role_policy = file("assume_role_policy.json")
}

data "archive_file" "zip_function" {
  type        = var.archive_file_type
  source_file = var.archive_file_source
  output_path = var.archive_file_output_path

}

resource "aws_lambda_layer_version" "requests_layer" {
  filename            = var.layer_filename
  layer_name          = var.layer_name
  compatible_runtimes = [var.runtime]
}

resource "aws_lambda_function" "sns_lambda" {

  filename      = var.lambda_filename
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler
  runtime       = var.runtime
  layers        = [aws_lambda_layer_version.requests_layer.arn]
  environment {
    variables = {
      SLACK_URL = var.slack_url
    }
  }
  tracing_config {
    mode = "Active"
  }
}

resource "aws_sns_topic" "slack_sns_topic" {
  name              = var.sns_topic_name
  kms_master_key_id = var.kms_master_key_id
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.slack_sns_topic.arn
  protocol  = var.protocol_user_updates_sqs_target
  endpoint  = aws_lambda_function.sns_lambda.arn
}

resource "aws_lambda_permission" "with_sns" {
  statement_id  = var.aws_lambda_permission_statement_id
  action        = var.aws_lambda_permission_action
  function_name = aws_lambda_function.sns_lambda.arn
  principal     = var.aws_lambda_permission_principal
  source_arn    = aws_sns_topic.slack_sns_topic.arn
}



