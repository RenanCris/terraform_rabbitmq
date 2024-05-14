# Criação da VPC
resource "aws_vpc" "config_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.prefixo_name} - VPC"
  }
}

resource "aws_subnet" "config_private_subnet" {
  vpc_id     = aws_vpc.config_vpc.id
  cidr_block = var.cidr_block_subnet

  tags = {
    Name = "${var.prefixo_name} - Subnet"
  }
}
