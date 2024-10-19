#Internet Gateway
module "igw" {
  source = "./modules/t-aws-igw"
  vpc-id = var.default_vpc-id
}

#Route Table: 0.0.0.0/0 -> IGW
module "route_table" {
  source     = "./modules/t-aws-rt"
  vpc-id     = var.default_vpc-id
  gateway-id = module.igw.id
}

#Route Table Association
module "route_table_association" {
  source    = "./modules/t-aws-rta"
  subnet-id = var.default_subnet-id
  rt-id     = module.route_table.id
}

#SNS Topic
module "sns_topic" {
  source       = "./modules/t-aws-sns_topic"
  name         = "yyk-topic"
  display_name = "YYK topic"
}

#SNS Topic Subscription
module "sns_topic_subscription" {
  source   = "./modules/t-aws-sns_topic_subscription"
  arn      = module.sns_topic.arn
  protocol = "email"
  endpoint = var.sns_topic_subscription-endpoint
}

#Amazon EC2
module "ec2" {
  source      = "./modules/t-aws-ec2"
  subnet-id   = var.default_subnet-id
  isMonitored = true
}

#CloudWatch Alarm
module "cloudwatch_metric_alarm" {
  source = "./modules/t-aws-cloudwatch_metric_alarm"
  alarm_name               = "CPUUtilization"
  comparison_operator      = "GreaterThanOrEqualToThreshold" #>=
  evaluation_periods       = "1"
  metric_name              = "CPUUtilization"
  namespace                = "AWS/EC2" #CloudWatch에 메트릭을 publish함. 다음 문서 참조: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html
  period                   = "60"  # 1분 단위
  statistic                = "Average"
  threshold                = "60" #60% 이상일 시 알람
  alarm_description        = "This alarm fires when CPU utilization exceeds 60%"
  ec2-id-to_monitor        = module.ec2.id
  alarm_actions            = [module.sns_topic.arn]
}

