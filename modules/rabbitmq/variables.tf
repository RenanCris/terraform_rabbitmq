variable "instance_type" {
  description = "Type of EC2 instance for RabbitMQ nodes"
  default     = "t2.micro"
}

variable "rabbitmq_user" {
  description = "Username for RabbitMQ management"
  default     = "admin"
}

variable "rabbitmq_password" {
  description = "Password for RabbitMQ management"
}

variable "engine_version" {
  default = "3.8.23"
}

variable "prefixo_name" {
  description = "Descrição do prefixo para o nome de cada recurso"
  type        = string
}

variable "private_subnet_ids" {
  type = string
}

# variable "security_group" {
#   type = string
# }