resource "aws_iam_policy" "github_token_policy" {
  name        = "github-token-access-policy"
  description = "IAM policy to allow EC2 instance to access GitHub token from Secrets Manager"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "secretsmanager:GetSecretValue"
        Effect   = "Allow"
        Resource = "arn:aws:secretsmanager:${var.region}:${data.aws_caller_identity.current.account_id}:secret:github-actions-token-*"
      }
    ]
  })
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2-github-actions-runner-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_github_token_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.github_token_policy.arn
}
output "iam_role_arn" {
  description = "IAM Role ARN for EC2 instance to access the GitHub token"
  value       = aws_iam_role.ec2_role.arn
}
