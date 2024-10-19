resource "aws_route_table" "internet" {
  vpc_id = var.vpc-id

  route {
    cidr_block = var.cidr_block #from
    gateway_id = var.gateway-id   #to
  }
}
