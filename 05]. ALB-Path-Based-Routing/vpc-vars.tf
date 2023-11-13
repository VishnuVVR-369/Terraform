variable "vpc_name" {
  default     = "vpc"
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_availability_zones" {
  default     = ["us-east-1a"]
  type        = list(string)
  description = "Availability zones for the VPC"
}

variable "vpc_public_subnets" {
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  type        = list(string)
  description = "Public subnets for the VPC"
}

variable "vpc_private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  type        = list(string)
  description = "Private subnets for the VPC"
}

variable "vpc_database_subnets" {
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
  type        = list(string)
  description = "Database subnets for the VPC"
}

variable "vpc_create_database_subnet_group" {
  default     = false
  type        = bool
  description = "Create a database subnet group"
}

variable "vpc_create_database_subnet_route_table" {
  default     = false
  type        = bool
  description = "Create a database subnet route table"
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = true
}

variable "vpc_single_nat_gateway" {
  description = "VPC Single NAT Gateway"
  type        = bool
  default     = true
}