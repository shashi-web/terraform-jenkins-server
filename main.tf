
module "myapp_vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block

}

module "myapp_subnet" {
  source            = "./modules/subnets"
  subnet_cidr_block = var.subnet_cidr_block
  vpc_id            = module.myapp_vpc.vpc_id

}

module "myapp_route_tables" {
  source    = "./modules/route_table"
  vpc_id    = module.myapp_vpc.vpc_id
  subnet_id = module.myapp_subnet.subnet_id

}

module "myapp_server" {
  source     = "./modules/instance"
  vpc_id     = module.myapp_vpc.vpc_id
  subnet_id  = module.myapp_subnet.subnet_id
  image_name = var.image_name
  public_key = var.public_key

}

