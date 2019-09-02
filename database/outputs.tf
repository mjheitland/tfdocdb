#--- database/outputs.tf
output "docdb_cluster_id" {
  value = aws_docdb_cluster.docdb_cluster.id
}
output "docdb_node_ids" {
  value = "${join(", ", aws_docdb_cluster_instance.docdb_node.*.id)}"
}
