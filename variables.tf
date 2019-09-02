#--- root/variables.tf
variable "project_name" {
  description = "project name is used as resource tag"
  type        = string
}

#--- networking variables
variable "vpc_cidr" {
  description = "separate vpc for this project"
  type        = string
}
variable "subpub_cidrs" { 
  description = "cidr blocks for public subnets"
  type        = list(string)
}
variable "subprv_cidrs" { 
  description = "cidr blocks for private subnets"
  type        = list(string)
}
variable "access_ip" {
  description = "cidr block for incoming traffic"
  type        = string
}
variable "bastion_ports" {
  description = "ingress ports"
  type = list(object({
    from_port = number
    to_port   = number
  }))
}
variable "docdb_ports" {
  description = "ingress ports"
  type = list(object({
    from_port = number
    to_port   = number
  }))
}

#--- compute variables
variable "key_name" {
  description = "name of keypair to access ec2 instances"
  type        = string
}
variable "public_key_path" {
  description = "file path on deployment machine to public rsa key to access ec2 instances"
  type        = string
}
variable "instance_type" {
  description = "type of ec2 instance"
  type        = string
}

#--- database variables
variable "master_username" {
  description = "user to access documentdb"
  type        = string
  default     = "user1"
}
variable "master_password" {
  description = "password to access documentdb"
  type        = string
}
