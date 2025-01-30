variable "eip_allocation_id" {
  description = "Elastic IP allocation ID for NAT Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID for NAT Gateway"
  type        = string
}
