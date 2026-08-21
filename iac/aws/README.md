# AWS Sample Terraform Stack (POC-2)

This is a small, disposable Terraform sample used to demonstrate IaC code
scanning (Checkov) and GitHub Copilot Code Review on pull requests.

It is **not** intended to be applied against a real AWS account. Names,
CIDRs, and identifiers are fake/example values only, and no credentials are
included.

## Resources

- `aws_s3_bucket` with versioning and a public access block (private by default)
- `aws_vpc` and `aws_security_group` with restricted ingress
- `aws_ebs_volume` (encrypted)
- `aws_db_subnet_group` and `aws_db_instance` (not publicly accessible)
- `aws_iam_policy` scoped to specific actions and resources

Vulnerable variants of this stack are introduced on separate `poc-2.2-iac/*`
branches, each changing exactly one setting, for testing Checkov detection
and code review tooling.
