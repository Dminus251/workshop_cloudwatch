variable "alarm_name" {
  type = string
}

variable "comparison_operator"{
  type = string
}

variable "evaluation_periods" {
  type = string
}

variable "metric_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "period" {
  type = string
}

variable "statistic" {
  type = string
}

variable "threshold" {
  type = string
}

variable "alarm_description" {
  type = string
}

variable "ec2-id-to_monitor" {
  type = string
}

variable "alarm_actions" {
  type = list(string)
}
