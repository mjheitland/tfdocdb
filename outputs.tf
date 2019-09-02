#--- root/outputs.tf ---
output "project_name" {
  value = var.project_name
}

#--- networking
output "vpc_id" {
  value = module.networking.vpc_id
}
output "igw_id" {
  value = module.networking.igw_id
}
output "subpub_ids" {
  value = module.networking.subpub_ids
}
output "subprv_ids" {
  value = module.networking.subprv_ids
}
output "rtpub_ids" {
  value = module.networking.rtpub_ids
}
output "rtprv_ids" {
  value = module.networking.rtprv_ids
}
output "sgbastion_id" {
  value = module.networking.sgbastion_id
}
output "sgdocdb_id" {
  value = module.networking.sgdocdb_id
}

#--- compute
output "keypair_id" {
  value = module.compute.keypair_id
}
output "bastion_ids" {
  value = module.compute.bastion_ids
}
output "bastion_public_ips" {
  value = module.compute.bastion_public_ips
}

#--- database
output "master_username" {
  value   = var.master_username
}
output "master_password" {
  value = var.master_password
}
output "docdb_cluster_id" {
  value = module.database.docdb_cluster_id
}
output "docdb_node_ids" {
  value = module.database.docdb_node_ids
}
