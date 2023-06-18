resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-route-table"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_route_table_association" "subnet-route-table" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.route_table.id
}