#--- database/main.tf
# https://www.terraform.io/docs/providers/aws/r/docdb_cluster.html
resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier      = "mh-docdb-cluster"
  apply_immediately       = true
  engine                  = "docdb"
  master_username         = "user1"
  master_password         = "sjliib77"
  backup_retention_period = 5
  preferred_backup_window = "00:00-02:00"
  skip_final_snapshot     = true
  storage_encrypted       = true
  #vpc_security_group_ids  = []
  tags = { 
    name = format("%s_docdb_cluster", var.project_name)
    project_name = var.project_name
  }
}

# https://www.terraform.io/docs/providers/aws/r/docdb_cluster_instance.html
resource "aws_docdb_cluster_instance" "docdb_node" {
  count              = 1
  identifier         = "docdb-node-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb_cluster.id
  instance_class     = "db.r5.large"
  tags = { 
    name = format("%s_docdb_node_%d", var.project_name, count.index)
    project_name = var.project_name
  }
}
