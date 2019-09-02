#--- database/variables.tf
variable "project_name" {
  description = "project name is used as resource tag"
  type        = string
}
variable "master_username" {
  description = "user to access documentdb"
  type        = string
}
variable "master_password" {
  description = "password to access documentdb"
  type        = string
}
variable "subprv_ids" { 
  description = "ids of private subnets"
  type        = list(string)
}
variable "sgbastion_id" {
  description = "id of the bastion security group"
  type        = string
}
variable "sgdocdb_id" {
  description = "id of the docdb security group"
  type        = string
}
