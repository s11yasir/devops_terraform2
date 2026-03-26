resource "aws_vpc" "my_vpc" {
  provider = aws.east
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "main_subnet" {
  provider = aws.east
  count = 2
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "var.vpc_cidr"
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "main-subnet"
  }
  
}