resource "aws_lambda_permission" "allow_public_function_url" {
  statement_id           = "FunctionURLAllowPublicAccess-01"
  action                 = "lambda:InvokeFunctionUrl"
  function_name          = module.function.function_name
  principal              = "*"
  function_url_auth_type = "NONE"
}

resource "aws_lambda_permission" "allow_public_invoke_function" {
  statement_id  = "FunctionURLAllowInvokeFunction-01"
  action        = "lambda:InvokeFunction"
  function_name = module.function.function_name
  principal     = "*"
}
