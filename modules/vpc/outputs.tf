output "vpc_id" {
  value = aws_vpc.config_vpc.id
}

output "private_subnet_ids" {
  value = aws_subnet.config_private_subnet.*.id
}