resource "aws_codepipeline" "dummy_api_pipeline" {
  name     = "dummy-api-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = "your-artifact-bucket"
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner           = "AWS"
      provider       = "CodeCommit"
      version         = "1"
      output_artifacts = ["source_output"]
      configuration = {
        RepositoryName = "dummy-api-repo"
        BranchName     = "main"
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name             = "Deploy"
      category         = "Deploy"
      owner           = "AWS"
      provider       = "CodeDeployToECS"
      version         = "1"
      input_artifacts = ["source_output"]
      configuration = {
        ApplicationName     = aws_codedeploy_app.dummy_api.name
        DeploymentGroupName = aws_codedeploy_deployment_group.dummy_api_group.name
      }
    }
  }
}


# Uses AWS CodePipeline for automated deployments.