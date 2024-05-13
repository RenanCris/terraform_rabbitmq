output "rabbitmq_host" {
  description = "RabbitMQ host"
  value       = aws_mq_broker.config_rabbitmq.instances[0].endpoints[0]
}

output "rabbitmq_management_url" {
  description = "RabbitMQ management URL"
  value       = "http://${aws_mq_broker.config_rabbitmq.instances[0].endpoints[0]}:15672"
}