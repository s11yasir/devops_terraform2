module "vpc" {
    
  source = "terraform-aws-modules/vpc/aws"
  enable_nat_gateway = true
  


  name = "my-vpc"
  cidr = "10.0.0.0/16"
  

  enable_vpn_gateway = true
  single_nat_gateway = true

}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = module.vpc.vpc_id
  
}

resource "aws_route_table" "public_route_table" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_subnet" "public_subnet" {
count = length(var.availability_zones)
  vpc_id            = module.vpc.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = var.availability_zones[count.index]
  
}