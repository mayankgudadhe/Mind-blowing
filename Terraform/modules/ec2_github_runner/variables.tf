variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-02972a2a0ac299bb7"  
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "The public subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}

variable "github_token_secret_id" {
  description = "The AWS Secrets Manager secret ID for the GitHub token"
  type        = string
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}
