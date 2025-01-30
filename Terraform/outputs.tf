# Output for the GitHub Runner EC2 Instance ID
output "github_runner_instance_id" {
  description = "The ID of the GitHub Actions runner EC2 instance"
  value       = module.github_runner.github_runner_instance_id
}

# Output for the IAM Role ARN created for EC2 instance
output "ec2_role_arn" {
  description = "IAM Role ARN for EC2 instance to access GitHub token from Secrets Manager"
  value       = module.iam_role.iam_role_arn
}

# Output for the public subnet ID
output "public_subnet_id" {
  description = "The ID of the public subnet created"
  value       = module.subnet.public_subnet_id
}

# Output for the private subnet ID
output "private_subnet_id" {
  description = "The ID of the private subnet created"
  value       = module.subnet.private_subnet_id
}

# Output for the Security Group ID created for the public subnet
output "public_security_group_id" {
  description = "The ID of the security group created for the public subnet"
  value       = module.security_group.public_sg_id
}

# Output for the Security Group ID created for the private subnet
output "private_security_group_id" {
  description = "The ID of the security group created for the private subnet"
  value       = module.security_group.private_sg_id
}
