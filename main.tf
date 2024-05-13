terraform {
  required_version = ">= 1.1.0"
}

provider "aws" {
  region     = var.AWS_DEFAULT_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = var.cidr_block_vpc
  prefixo_name      = "${var.prefix_enviroment} - ${local.prefixo_servicos}"
  cidr_block_subnet = var.cidr_block_subnet
}

module "security_group" {
  source       = "./modules/security_group"
  vpc_id       = module.vpc.vpc_id
  prefixo_name = "${var.prefix_enviroment} - ${local.prefixo_servicos}"
  name         = var.name_security_group
}

module "rabbitmq" {
  source             = "./modules/rabbitmq"
  instance_type      = var.instance_type
  rabbitmq_user      = var.rabbitmq_user
  rabbitmq_password  = var.rabbitmq_password
  prefixo_name       = "${var.prefix_enviroment} - ${local.prefixo_servicos}"
  private_subnet_ids = join(",", module.vpc.private_subnet_ids)
  security_group     = module.security_group.security_group_id
}