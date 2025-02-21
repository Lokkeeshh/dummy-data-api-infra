resource "aws_ecs_task_definition" "dummy_api_task" {
  family                   = "dummy-api-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "dummy-api-container"
      image     = "your-account-id.dkr.ecr.us-east-1.amazonaws.com/dummy-api:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}


# Uses AWS Fargate (serverless containers).
# Pulls image from ECR.