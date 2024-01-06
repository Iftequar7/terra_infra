output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "pub_sub_id" {
  value = aws_subnet.pub_1.id
}

output "pvt_sub_id" {
  value = aws_subnet.pvt_1.id
}

output "rtb_id" {
  value = aws_route_table.rtb.id
}

