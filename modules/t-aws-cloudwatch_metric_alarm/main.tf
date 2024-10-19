resource "aws_cloudwatch_metric_alarm" "CPUUtilization" {
  alarm_name               = var.alarm_name
  comparison_operator      = var.comparison_operator
  evaluation_periods       = var.evaluation_periods 
  metric_name              =  var. metric_name
  namespace		   = var.namespace
  period                   = var.period
  statistic                = var.statistic
  threshold                = var.threshold
  alarm_description        = var.alarm_description
  dimensions               = {
    InstanceId           = var.ec2-id-to_monitor #모니터링할 인스턴스 id
  }
  alarm_actions            = var.alarm_actions
}
