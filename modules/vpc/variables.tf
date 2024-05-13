variable "cidr_block" {
  description = "CIDR block da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "prefixo_name" {
  description = "Descrição do prefixo para o nome de cada recurso"
  type        = string
}

variable "cidr_block_subnet" {
  description = "CIDR block da Subnet"
  type        = string
  default     = "10.0.0.0/24"
}