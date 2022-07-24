resource "aws_lb" "application_lb" {
  name               = "scg-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.default_sec_group.id]
  subnets            = [data.aws_subnet.lb_subnet_1.id, data.aws_subnet.lb_subnet_2.id]
}

resource "aws_lb_target_group" "application_target_group" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.application_target_group.arn
  target_id        = aws_instance.application_server.id
  port             = 80
}

resource "aws_lb_listener" "redirect_ssl" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "ssl" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_target_group.arn
  }
}
