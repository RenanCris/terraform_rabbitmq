resource "aws_mq_broker" "config_rabbitmq" {
  engine_type        = "RabbitMQ"
  engine_version     = var.engine_version
  host_instance_type = var.instance_type
  subnet_ids         = [var.private_subnet_ids]
  # security_groups    = [var.security_group]
  deployment_mode    = "SINGLE_INSTANCE"
  broker_name        = "rabbitmq-cluster"

  maintenance_window_start_time {
    day_of_week = "SUNDAY"
    time_of_day = "02:00"
    time_zone   = "America/New_York"
  }

  publicly_accessible = true

  user {
    username = var.rabbitmq_user
    password = var.rabbitmq_password
  }

  tags = {
    Name = "${var.prefixo_name} - Rabbitmq"
  }
}

