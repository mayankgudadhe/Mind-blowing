variable "region" {
  description = "AWS region"
  type        = string
}

variable "github_secret_name" {
  description = "The name of the GitHub token secret in Secrets Manager"
  type        = string
}

# This will hold the EC2 role that we create
output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}
