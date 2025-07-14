terraform {
  backend "s3" {
    bucket  = "mydevopstf"
    key     = "eks-cluster/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
} 