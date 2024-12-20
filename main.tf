
/*
provider "aws" {
  region = "us-west-2" # Change to your desired region
}


variable "github_organization" {
  description = "(Required) Name of the GitHub organization"
  type        = string
}

variable "github_repository" {
  description = "(Required) The name of the GitHub repository to use"
  type        = string
}


resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"] # GitHub's OIDC thumbprint
}

data "aws_iam_policy_document" "github_actions_read_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    # Condition to limit to default AWS OIDC audience
    # see: https://github.com/aws-actions/configure-aws-credentials?tab=readme-ov-file#oidc-audience
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    # Condition to limit to pull requests
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        "repo:${var.github_organization}/${var.github_repository}:pull_request",
        "repo:${var.github_organization}/${var.github_repository}:ref/pull/*",
        "repo:${var.github_organization}/${var.github_repository}:ref:refs/heads/${local.repository_default_branch_name}"
      ]
    }
    # # Condition to limit to pull requests targeting 'main' branch
    # condition {
    #   test     = "StringEquals"
    #   variable = "token.actions.githubusercontent.com:ref"
    #   values = [
    #     "refs/heads/${var.repository_default_branch_name}" # Only allow for PRs targeting the 'main' branch
    #   ]
    # }
  }
}

*/
