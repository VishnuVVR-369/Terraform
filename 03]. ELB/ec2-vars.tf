# AWS EC2 Instance Terraform Variables

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "EC2 instance keypair"
  default     = "global-key"
}

variable "private_instance_count" {
  description = "Number of private instances to launch"
  type        = number
  default     = 1
}