# Resource: aws_subnets
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_subnet_1" {

  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = var.public-cidr1
  availability_zone       = var.public-subnet-zone1
  map_public_ip_on_launch = true

  tags = {
    Name                            = "${var.vpc_name}-public-us-east-1a"
    "kubernetes.io/cluster/eks-poc" = "shared"
    "kubernetes.io/role/elb"        = 1
  }
}

resource "aws_subnet" "public_subnet_2" {

  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = var.public-cidr2
  availability_zone       = var.public-subnet-zone2
  map_public_ip_on_launch = true

  tags = {
    Name                            = "${var.vpc_name}-public-us-east-1b"
    "kubernetes.io/cluster/eks-poc" = "shared"
    "kubernetes.io/role/elb"        = 1
  }
}

resource "aws_subnet" "private_subnet_1" {

  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = var.private-cidr1
  availability_zone       = var.private-subnet-zone1
  map_public_ip_on_launch = false

  tags = {
    Name                              = "${var.vpc_name}-private-us-east-1a"
    "kubernetes.io/cluster/eks-poc"   = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

}

resource "aws_subnet" "private_subnet_2" {

  vpc_id                  = aws_vpc.vpc-main.id
  cidr_block              = var.private-cidr2
  availability_zone       = var.private-subnet-zone2
  map_public_ip_on_launch = false

  tags = {
    Name                              = "${var.vpc_name}-private-us-east-1b"
    "kubernetes.io/cluster/eks-poc"   = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
