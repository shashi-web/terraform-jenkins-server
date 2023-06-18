# data "aws_subnet" "existing_subnet" {
#   filter {
#     name   = "tag:Name"
#     values = [var.subnet_name]
#   }
# }

# data "aws_vpc" "existing_vpc" {
#   filter {
#     name   = "tag:Name"
#     values = [var.vpc_name]
#   }
# }