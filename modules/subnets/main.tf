

resource "aws_subnet" "subnet" {
  #   vpc_id     = data.aws_vpc.existing_vpc.id
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "terraform-subnet"
  }
}