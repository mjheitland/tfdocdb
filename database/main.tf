#--- database/main.tf
# https://www.terraform.io/docs/providers/aws/r/docdb_cluster.html
resource "aws_docdb_subnet_group" "docdbsubnetgroup" {
  name       = "docdbsubnetgroup"
  subnet_ids = var.subprv_ids

  tags = {
    name = format("%s_docdb_subnet_group", var.project_name)
    project_name = var.project_name
  }
}

resource "aws_docdb_cluster" "docdb_cluster" {
  cluster_identifier      = "mh-docdb-cluster"
  apply_immediately       = true
  db_subnet_group_name    = aws_docdb_subnet_group.docdbsubnetgroup.name
  engine                  = "docdb"
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 5
  preferred_backup_window = "00:00-02:00"
  skip_final_snapshot     = true
  storage_encrypted       = true
  vpc_security_group_ids  = [var.sgdocdb_id]
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
