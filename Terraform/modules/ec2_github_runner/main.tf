resource "aws_instance" "github_runner" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = "Mayank"  # Key name set to Mayank
  security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.ec2_role_arn
  
  # User data to install Git and setup GitHub self-hosted runner
  user_data = <<-EOF
              #!/bin/bash
              # Update and install git
              yum update -y
              yum install -y git curl

              # Download the GitHub Actions Runner
              mkdir actions-runner && cd actions-runner
              curl -O -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz
              tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz

              # Fetch the GitHub token from AWS Secrets Manager
              GITHUB_TOKEN=$(aws secretsmanager get-secret-value --secret-id ${var.github_token_secret_id} --query 'SecretString' --output text)

              # Configure the runner with the GitHub repository URL and token
              ./config.sh --url https://github.com/${var.github_owner}/${var.github_repo} --token $GITHUB_TOKEN

              # Start the GitHub Actions runner
              ./run.sh
              EOF

  tags = {
    Name = "GitHub Self-Hosted Runner"
  }
}

output "github_runner_instance_id" {
  value = aws_instance.github_runner.id
}
