resource "aws_api_gateway_rest_api" "dummy_api" {
  name        = "dummy-api"
  description = "API for generating dummy data"
}

resource "aws_api_gateway_resource" "generate" {
  rest_api_id = aws_api_gateway_rest_api.dummy_api.id
  parent_id   = aws_api_gateway_rest_api.dummy_api.root_resource_id
  path_part   = "generate"
}

resource "aws_api_gateway_method" "get_generate" {
  rest_api_id   = aws_api_gateway_rest_api.dummy_api.id
  resource_id   = aws_api_gateway_resource.generate.id
  http_method   = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito_authorizer.id
}


# Uses Amazon Cognito for authentication.
# Supports rate limiting via AWS WAF.