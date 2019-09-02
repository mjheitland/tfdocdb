#--- terraform.tfvars ---
project_name = "tfdocdb"
vpc_cidr     = "10.50.0.0/16"
subpub_cidrs = [
  "10.50.101.0/24"
  #,"10.50.102.0/24"
]
# we need at least 3 private subnets in our VPC, otherwise documentdb would not accept it!
subprv_cidrs = [
  "10.50.201.0/24",
  "10.50.202.0/24",
  "10.50.203.0/24"
]
access_ip     = "0.0.0.0/0"
bastion_ports = [
  { # ssh
    from_port = 22,
    to_port   = 22
  }
# ,
# { # web http
#   from_port = 80,
#   to_port   = 80
# } 
]
docdb_ports = [
  { # documentdb
    from_port = 27017, 
    to_port   = 27017
  } 
]

#--- compute
key_name        = "dbdockey"
public_key_path = "~/.ssh/id_rsa.pub"
instance_type   = "t2.micro"
