output "sns_topic_arn" {
  value = aws_sns_topic.slack_sns_topic.arn
}