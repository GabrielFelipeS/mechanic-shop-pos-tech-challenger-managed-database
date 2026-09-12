output "database_endpoint" {
  description = "Private endpoint used to build the application's JDBC connection URL."
  value       = aws_db_instance.postgres.address
}

output "database_port" {
  value = aws_db_instance.postgres.port
}

output "database_name" {
  value = aws_db_instance.postgres.db_name
}

output "database_security_group_id" {
  value = aws_security_group.postgres.id
}
