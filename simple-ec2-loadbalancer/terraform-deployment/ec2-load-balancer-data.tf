data "aws_acm_certificate" "cert" {
  domain = "scg.coldnorthadmin.com"
}

data "aws_security_group" "default_sec_group" {
  name = "default"
}

data "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}

data "aws_subnet" "lb_subnet_1" {
  id = "subnet-9ff9def6"
}

data "aws_subnet" "lb_subnet_2" {
  id = "subnet-9cdda2e7"
}
