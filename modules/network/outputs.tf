output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "vpc_tls_security_group_id" {
  value = aws_security_group.vpc_tls.id
}

# output "private_route_table_id" {
#   value = aws_route_table.private.id
# }
