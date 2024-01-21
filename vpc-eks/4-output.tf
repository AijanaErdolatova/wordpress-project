
output "vpc_id" {
  value       = aws_vpc.vpc-main.id
  description = "VPC id."
  sensitive   = false
}

output "igw_id" {
  value = aws_internet_gateway.igw-main.id
}

output "public_rt_id" {
  value = aws_route_table.public-rt.id
}
output "private-rt1" {
  value = aws_route_table.private-rt1.id
}
output "private-rt2" {
  value = aws_route_table.private-rt2.id
}

output "public-subnet1" {
  value = aws_subnet.public_subnet_1.id
}

output "public-subnet2" {
  value = aws_subnet.public_subnet_2.id
}

output "private-subnet1" {
  value = aws_subnet.private_subnet_1.id
}

output "private-subnet2" {
  value = aws_subnet.private_subnet_2.id
}
