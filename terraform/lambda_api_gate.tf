
resource "aws_api_gateway_rest_api" "example" {
  name = "example"
}

resource "aws_api_gateway_resource" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  parent_id = aws_api_gateway_rest_api.example.root_resource_id
  path_part = "{proxy+}"
}

resource "aws_api_gateway_method" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_resource.example.id
  http_method = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "example" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_resource.example.id
  http_method = "ANY"
  type = "AWS_PROXY"
  integration_http_method = "POST"
  uri = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:YOUR_ACCOUNT_ID:function:YOUR_LAMBDA_FUNCTION_NAME/invocations"
}

resource "aws_lambda_function" "example" {
  filename = "js_for_lamda.zip"
  function_name = "example"
  role = "arn:aws:iam::YOUR_ACCOUNT_ID:role/service-role/YOUR_ROLE_NAME"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_code_hash = filebase64sha256("js_for_lamda.zip")
}