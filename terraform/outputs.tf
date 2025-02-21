output "ecs_cluster_id" {
  description = "The ID of the created ECS cluster."
  value       = aws_ecs_cluster.main.id
}

output "ecs_service_name" {
  description = "The name of the ECS service."
  value       = aws_ecs_service.api.name
}

output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs."
  value       = aws_subnet.public[*].id
}
