resource "aws_route_table" "route_table" {
  vpc_id = data.aws_vpc.existing_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "terraform-route-table"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.existing_vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_route_table_association" "subnet-route-table" {
  subnet_id      = data.aws_subnet.existing_subnet.id
  route_table_id = aws_route_table.route_table.id
}