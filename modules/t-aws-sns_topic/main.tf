resource "aws_sns_topic" "workshop_sns" {
  name         = var.name
  display_name = var.display_name
}
