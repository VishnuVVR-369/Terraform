variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to deploy the resources to"
}

variable "aws_profile" {
  default     = "default"
  type        = string
  description = "AWS profile to use"
}

variable "environment" {
  default     = "dev"
  type        = string
  description = "Environment to deploy to"
}

variable "business_division" {
  default     = "research"
  type        = string
  description = "Business division to deploy to"
}