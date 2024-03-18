provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "ec2_stop_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid = "",
    }]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "ec2_stop_lambda_policy"
  description = "IAM policy for EC2 stopping lambda"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "ec2:StopInstances",
        "ec2:DescribeInstances",
      ],
      Resource = "*",
      Effect = "Allow",
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_lambda_function" "stop_ec2_instances" {
  function_name = "stopEC2Instances"

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"

  role = aws_iam_role.lambda_execution_role.arn
}

