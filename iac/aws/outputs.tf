output "bucket_name" {
  description = "Name of the sample S3 bucket"
  value       = aws_s3_bucket.example.bucket
}

output "security_group_id" {
  description = "ID of the sample security group"
  value       = aws_security_group.example.id
}

output "ebs_volume_id" {
  description = "ID of the sample EBS volume"
  value       = aws_ebs_volume.example.id
}

output "db_instance_identifier" {
  description = "Identifier of the sample RDS instance"
  value       = aws_db_instance.example.identifier
}

output "iam_policy_arn" {
  description = "ARN of the sample IAM policy"
  value       = aws_iam_policy.example.arn
}
