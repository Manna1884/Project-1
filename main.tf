#VPC 
resource "aws_vpc" "project1" {
  cidr_block       = var.cidr_for_vpc
  instance_tenancy = "default"

  tags = {
    Name = "project1"
  }
}

#Public Subnets-01
resource "aws_subnet" "public-sub1" {
  vpc_id     = aws_vpc.project1.id
  cidr_block = var.cidr_for_Public_subnet1

  tags = {
    Name = "public-sub1"
  }
}

#Public Subnets-02
resource "aws_subnet" "public-sub2" {
  vpc_id     = aws_vpc.project1.id
  cidr_block = var.cidr_for_Public_subnet2

  tags = {
    Name = "public-sub2"
  }
}

#Private Subnets-01
resource "aws_subnet" "private-sub1" {
  vpc_id     = aws_vpc.project1.id
  cidr_block = var.cidr_for_Private_subnet1

  tags = {
    Name = "private-sub1"
  }
}

  #Private Subnets-02
resource "aws_subnet" "private-sub2" {
  vpc_id     = aws_vpc.project1.id
  cidr_block = var.cidr_for_Private_subnet2

  tags = {
    Name = "private-sub2"
  }
}


  #Public Route Table
  resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.project1.id

  tags = {
    Name = "public-route-table"
  }
}

  #Private Route Table
  resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.project1.id

  tags = {
    Name = "private-route-table"
  }
}

#Public Route Table Associations
resource "aws_route_table_association" "public-route-table-association1" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "pulic-route-table-association2" {
  subnet_id      = aws_subnet.public-sub2.id
  route_table_id = aws_route_table.public-route-table.id
}


#Private Route Table Associations
resource "aws_route_table_association" "private-route-table-association1" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-route-table.id
}


#Internet Gateway
resource "aws_internet_gateway" "IGW-PROJECT1" {
  vpc_id = aws_vpc.project1.id

  tags = {
    Name = "IGW-PROJECT1"
  }
}

#Route Internet Gateway Through Public Route Table
resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-route-table.id
  gateway_id                = aws_internet_gateway.IGW-PROJECT1.id
  destination_cidr_block    = "0.0.0.0/0"
}



