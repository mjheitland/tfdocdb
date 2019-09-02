#--- compute/outputs.tf
output "keypair_id" {
  value = "${join(", ", aws_key_pair.keypair.*.id)}"
}
output "server_ids" {
  value = "${join(", ", aws_instance.server.*.id)}"
}
output "server_public_ips" {
  value = "${join(", ", aws_instance.server.*.public_ip)}"
}
