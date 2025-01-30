variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.10.2.0/24"
}

variable "availability_zone" {
  description = "The Availability Zone"
  type        = string
  default     = "ap-south-1a"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "key_name" {
  description = "The key name for the EC2 instance"
  type        = string
  default     = "Mayank"
}

variable "github_token_secret_id" {
  description = "The AWS Secrets Manager secret ID containing the GitHub token"
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

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-02972a2a0ac299bb7"  # Amazon Linux 2 AMI ID
}

variable "nat_gateway_enabled" {
  description = "Flag to enable NAT Gateway"
  type        = bool
  default     = true
}
variable "ec2_role_arn" {
  description = "IAM role ARN for the EC2 instance"
  type        = string
}