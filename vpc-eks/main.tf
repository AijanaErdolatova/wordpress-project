
resource "aws_vpc" "vpc-main" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags                             = { Name = var.vpc_name }
}

resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.vpc-main.id
  tags   = { Name = "${var.vpc_name}-igw-main" }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags          = { Name = "${var.vpc_name}-nat1" }
}

resource "aws_eip" "eip" {
  depends_on = [aws_internet_gateway.igw-main]
  tags       = { Name = "${var.vpc_name}-nat-gateway-ip" }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-main.id
  }
  tags = { Name = "${var.vpc_name}-public-rt" }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags       = { Name = "${var.vpc_name}-private-rt" }
  depends_on = [aws_nat_gateway.nat-gw]
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
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private2_associate" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private-rt.id
}






