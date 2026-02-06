provider "aws" {
  region = "us-east-2"
}

variable "name" {
  description = "Name of the Lambda function"
  type        = string
}

module "function" {
  source  = "brikis98/devops/book//modules/lambda"
  version = "1.0.0"

  name = var.name

  src_dir = "${path.module}/src" 
  runtime = "nodejs20.x"         
  handler = "index.handler"      

  memory_size = 128              
  timeout     = 5                

  environment_variables = {      
    NODE_ENV = "production"
  }

  create_url = true
}

output "function_url" {
  description = "URL of the Lambda function"
  value       = module.function.function_url
}
