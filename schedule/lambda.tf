/* 
Arquive the script
*/
data "archive_file" "python_lambda_package" {
  type = "zip"
  source_file = "${path.module}/code/lambda_function.py"
  output_path = "lambda_function.zip"
}

/*
  Create the lamda function
*/
/*resource "aws_lambda_function" "test_lambda_function" {
    function_name = "lambdaTest"
    
    filename      = "lambda_function.zip"
    source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
    role          = aws_iam_role.lambda_role.arn
    runtime       = "python3.6"
    handler       = "lambda_function.lambda_handler"
    timeout       = 10
}*/

resource "aws_lambda_function" "stop_ec2_instances" {
  function_name = "stopEC2Instances"

  filename         = "lambda_function.zip"
  source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"

  role = aws_iam_role.lambda_execution_role.arn

}