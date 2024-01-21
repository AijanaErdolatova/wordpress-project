
resource "aws_vpc" "vpc-main" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = var.vpc_name
  }
  # Enable/disable ClassicLink for the VPC.
  #enable_classiclink = false
  # Enable/disable ClassicLink DNS Support for the VPC.
  #enable_classiclink_dns_support = false
}

resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.vpc-main.id
  tags = {
    Name = "${var.vpc_name}-igw-main"
  }
}

resource "aws_nat_gateway" "nat-gw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "NAT1"
  }
}

resource "aws_nat_gateway" "nat-gw2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public_subnet_2.id
  tags = {
    Name = "NAT2"
  }
} #remove

resource "aws_eip" "eip1" {
  depends_on = [aws_internet_gateway.igw-main]
}

resource "aws_eip" "eip2" {
  depends_on = [aws_internet_gateway.igw-main]
} #remove

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-main.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table" "private-rt1" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw1.id
  }

  # A map of tags to assign to the resource.  
  tags = { Name = "${var.vpc_name}-private-rt1" }
}

resource "aws_route_table" "private-rt2" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw2.id
  } #remove

  tags = { Name = "${var.vpc_name}-private-rt2" }
}

resource "aws_route_table_association" "public1_associate" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public2_associate" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private1_associate" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private-rt1.id
}

resource "aws_route_table_association" "private2_associate" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private-rt2.id
} #remove






