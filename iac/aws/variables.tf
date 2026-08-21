variable "aws_region" {
  description = "AWS region for the sample stack"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the sample S3 bucket"
  type        = string
  default     = "example-poc-bucket-001"
}

variable "allowed_ingress_cidr" {
  description = "CIDR block allowed to reach the sample security group"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  description = "CIDR block for the sample VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_username" {
  description = "Master username for the sample RDS instance"
  type        = string
  default     = "exampleadmin"
}

variable "db_password" {
  description = "Master password for the sample RDS instance"
  type        = string
  sensitive   = true
}
