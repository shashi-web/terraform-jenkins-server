
module "myapp_vpc" {
    source = "./modules/vpc"
    cidr_block = var.cidr_block
    
}

module "myapp_subnet" {
    source = "./modules/subnets"
    subnet_cidr_block = var.subnet_cidr_block
    
}

module "myapp_route_tables" {
    source = "./modules/route_table"
    vpc_name = var.vpc_name
    subnet_name = var.subnet_name
    
}