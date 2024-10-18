provider "aws" {
  region = "us-west-2"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "devsecops-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = ["subnet-0933b7c2c444d654e", "subnet-09ad205904c7acd48"]
  }
}

resource "aws_iam_role" "eks_role" {
  name = "eks-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

