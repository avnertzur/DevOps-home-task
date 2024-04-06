resource "aws_lambda_function" "test_lambda" {
  function_name = "testLambdaFunction"
  package_type  = "Image"
  image_uri     = "jonathanpick/first-lambda:v1"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_function" "first_lambda" {
  function_name = "firstLambdaFunction"
  package_type  = "Image"
  image_uri     = "jonathanpick/first-lambda:v1"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_function" "second_lambda" {
  function_name = "secondLambdaFunction"
  package_type  = "Image"
  image_uri     = "jonathanpick/second-lambda:v1"
  role          = aws_iam_role.lambda_role.arn
}


resource "aws_iam_role" "lambda_role" {
  name = "serverless_lambda-${var.env_name}"

  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

