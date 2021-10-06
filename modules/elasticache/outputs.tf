output "arn" {
  value = aws_elasticache_replication_group.replication-group.arn
}
output "id" {
  value = aws_elasticache_replication_group.replication-group.id
}
output "engine_version_actual" {
  value = aws_elasticache_replication_group.replication-group.engine_version_actual
}
output "cluster_enabled" {
  value = aws_elasticache_replication_group.replication-group.cluster_enabled
}
output "configuration_endpoint_address" {
  value = aws_elasticache_replication_group.replication-group.configuration_endpoint_address
}
output "member_clusters" {
  value = aws_elasticache_replication_group.replication-group.member_clusters
}
output "cache_security_group_id" {
  value = aws_security_group.security-group.id
}
output "primary_endpoint_address" {
  value = aws_elasticache_replication_group.replication-group.primary_endpoint_address
}
output "reader_endpoint_address" {
  value = aws_elasticache_replication_group.replication-group.reader_endpoint_address
}
output "port" {
  value = "6379"
}

output "notification_topic_arn" {
  value = aws_elasticache_replication_group.replication-group.notification_topic_arn
}


