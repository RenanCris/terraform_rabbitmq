
# Criação do Security Group
resource "aws_security_group" "config_security_group" {
  vpc_id      = var.vpc_id
  name        = var.name
  description = "Security group para o cluster RabbitMQ"

  tags = {
    Name = "${var.prefixo_name} - SecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "amqp_mq_ingress" {
  security_group_id = aws_security_group.config_security_group.id
  from_port         = 5672
  to_port           = 5672
  ip_protocol       = "tcp"
  description       = "RabbitMQ AMQP"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_mq_ingress" {
  security_group_id = aws_security_group.config_security_group.id
  from_port         = 15672
  to_port           = 15672
  ip_protocol       = "tcp"
  description       = "RabbitMQ Management/UI"
  cidr_ipv4         = "0.0.0.0/0"
}