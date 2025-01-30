resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}
