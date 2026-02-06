provider "aws" {
  region = "us-east-2"
}

module "oidc_provider" {
  source       = "brikis98/devops/book//modules/github-aws-oidc"
  version      = "1.0.0"
  provider_url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source = "brikis98/devops/book//modules/gh-actions-iam-roles"
  version = "1.0.0"

  name              = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn

  enable_iam_role_for_testing = true

  # IMPORTANT: put YOUR repo here in the format: USERNAME/REPONAME
  github_repo = "umanggupta1/web3810"

  # Must match the base name used by the lambda-sample module later
  lambda_base_name = "lambda-sample"
}

