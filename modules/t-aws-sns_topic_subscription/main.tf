resource "aws_sns_topic_subscription" "workshop_sns_topic_subscription" {
  topic_arn = var.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}
