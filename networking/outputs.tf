#--- networking/outputs.tf ---
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "igw_id" {
  value = aws_internet_gateway.igw.id
}
output "subpub_ids" {
  value = aws_subnet.subpub.*.id
}
output "subprv_ids" {
  value = aws_subnet.subprv.*.id
}
output "rtpub_ids" {
  value = aws_route_table.rtpub.*.id
}
output "rtprv_ids" {
  value = aws_default_route_table.rtprv.*.id
}
output "sgbastion_id" {
  value = aws_security_group.sgbastion.id
}
output "sgdocdb_id" {
  value = aws_security_group.sgdocdb.id
}
