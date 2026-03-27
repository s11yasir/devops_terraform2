module "vpc" {
    
  source = "terraform-aws-modules/vpc/aws"
  enable_nat_gateway = true
  


  name = "my-vpc"
  cidr = "10.0.0.0/16"
  

  enable_vpn_gateway = true
  single_nat_gateway = true
  azs = var.availability_zones
  public_subnets = [for i in range(length(var.availability_zones)) : cidrsubnet(var.vpc_cidr, 8, i)]

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
resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.availability_zones)
  subnet_id = module.vpc.public_subnets[count.index]
  route_table_id = aws_route_table.public_route_table.id
  
}