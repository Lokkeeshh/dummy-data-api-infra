resource "aws_ecs_cluster" "dummy_api_cluster" {
  name = "dummy-api-cluster"
}

# Defining the ECS cluster where the Node.js application will run.