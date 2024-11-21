resource "aws_security_group" "instance-sg" {
  name        = "${var.name}-SecurityGroup_EC2"
  description = "Allows http from alb securitygroup"
  vpc_id      = var.default_vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "EVE-SecurityGroup_EC2"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allows_http_from_lb" {
  security_group_id            = aws_security_group.instance-sg.id
  referenced_security_group_id = aws_security_group.lb-sg.id

  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_security_group" "lb-sg" {
  name        = "${var.name}-SecurityGroup_LB"
  description = "Allows http from alb securitygroups"
  vpc_id      = var.default_vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.name}-SecurityGroup_LB"
  }
}


resource "aws_security_group_rule" "allows_http_from_myip" {
  type              = "ingress"
  security_group_id = aws_security_group.lb-sg.id
  cidr_blocks       = ["0.0.0.0/0"]

  from_port   = 80
  protocol    = "tcp"
  to_port     = 80
}