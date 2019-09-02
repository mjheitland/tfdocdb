#--- root/main.tf ---
provider "aws" {
}

# deploy networking resources
module "networking" {
  source        = "./networking"
  
  project_name  = var.project_name
  vpc_cidr      = var.vpc_cidr
  subpub_cidrs  = var.subpub_cidrs
  subprv_cidrs  = var.subprv_cidrs
  access_ip     = var.access_ip
  bastion_ports = var.bastion_ports
  docdb_ports   = var.docdb_ports
}

# Deploy Compute Resources
module "compute" {
  source          = "./compute"
  
  project_name    = var.project_name
  key_name        = var.key_name
  public_key_path = var.public_key_path
  instance_type   = var.instance_type
  subpub_ids      = module.networking.subpub_ids
  sgbastion_id    = module.networking.sgbastion_id
}

# Deploy Database Resources
module "database" {
  source          = "./database"
  
  project_name    = var.project_name
  master_username = var.master_username
  master_password = var.master_password
  subprv_ids      = module.networking.subprv_ids
  sgbastion_id    = module.networking.sgbastion_id
  sgdocdb_id      = module.networking.sgdocdb_id
}
