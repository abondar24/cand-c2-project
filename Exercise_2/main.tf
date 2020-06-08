provider "aws" {
region = "${var.region}"

}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
      "sts:AssumeRole"
      ],
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",

      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "uda_2" {
  filename      = "greet_lambda.zip"
  function_name = "greetLambda"
  role          = "${aws_iam_role.lambda_exec_role.arn}"
  handler       = "greet_lambda.lambda_handler"

  source_code_hash = "${filebase64sha256("greet_lambda.zip")}"

  runtime = "python3.7"

}
