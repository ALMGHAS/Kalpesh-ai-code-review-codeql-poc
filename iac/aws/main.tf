terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr
}

resource "aws_security_group" "example" {
  name        = "example-poc-sg"
  description = "Sample security group for POC"
  vpc_id      = aws_vpc.example.id

  ingress {
    description = "Restricted internal access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ingress_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10
  encrypted         = true
}

resource "aws_db_subnet_group" "example" {
  name       = "example-poc-db-subnet-group"
  subnet_ids = []
}

resource "aws_db_instance" "example" {
  identifier             = "example-poc-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.example.id]
}

resource "aws_iam_policy" "example" {
  name        = "example-poc-policy"
  description = "Sample scoped IAM policy for POC"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Resource = [aws_s3_bucket.example.arn, "${aws_s3_bucket.example.arn}/*"]
      }
    ]
  })
}
