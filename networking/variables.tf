#--- networking/variables.tf ---
variable "project_name" {
  description = "project name is used as resource tag"
  type        = string
}
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
