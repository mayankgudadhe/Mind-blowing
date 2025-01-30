resource "aws_nat_gateway" "main" {
  allocation_id = var.eip_allocation_id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "NAT Gateway"
  }
}

depends_on = [aws_internet_gateway.main]

resource "aws_eip" "main" {
  vpc = true
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}
