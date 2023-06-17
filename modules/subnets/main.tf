

resource "aws_subnet" "subnet" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "terraform-subnet"
  }
}