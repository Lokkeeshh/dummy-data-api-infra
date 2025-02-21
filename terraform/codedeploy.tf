resource "aws_codedeploy_app" "dummy_api" {
  name = "dummy-api-codedeploy"
  compute_platform = "ECS"
}

resource "aws_codedeploy_deployment_group" "dummy_api_group" {
  app_name               = aws_codedeploy_app.dummy_api.name
  deployment_group_name  = "dummy-api-group"
  service_role_arn       = aws_iam_role.codedeploy_role.arn
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"

  ecs_service {
    cluster_name = aws_ecs_cluster.dummy_api_cluster.name
    service_name = aws_ecs_service.dummy_api_service.name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [aws_lb_listener.http.arn]
      }
      target_group {
        name = aws_lb_target_group.blue.name
      }
      target_group {
        name = aws_lb_target_group.green.name
      }
    }
  }
}


# Uses AWS CodeDeploy to shift traffic between Blue & Green.