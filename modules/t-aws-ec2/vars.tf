variable "ami_id" {
  type = string
  default = "ami-02c329a4b4aba6a48" #Amazon Linux 2023
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "user_data" {
  type = string
  default =  <<-EOF
    #!/bin/sh
    sudo yum -y update
    sudo amazon-linux-extras install epel -y
    sudo yum install stress -y
    sudo stress -c 1 --backoff 300000000 -t 30m
    EOF
}

variable "subnet-id" {
  type = string
}

variable "isMonitored" {
  type = bool
}
