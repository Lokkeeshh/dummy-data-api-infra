variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
  default     = "dummy-data-api-cluster"
}

variable "task_cpu" {
  description = "CPU units for the ECS task."
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory for the ECS task."
  type        = number
  default     = 512
}

variable "container_image" {
  description = "The ECR image URL for the API container."
  type        = string
  default     = "<your-ecr-repo-url>:latest"
}
