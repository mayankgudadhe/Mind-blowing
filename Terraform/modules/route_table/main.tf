# Public Route Table (for internet access)
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
}

resource "aws_route_table_association" "public" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id            = var.gateway_id
}

# Private Route Table (for NAT Gateway)
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
}

resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}

resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id  # NAT Gateway ID
}
