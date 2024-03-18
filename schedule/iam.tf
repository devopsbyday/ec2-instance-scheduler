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



