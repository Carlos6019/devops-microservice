terraform {
  backend "s3" {
    bucket  = "devops-eks-terraform-state"
    key     = "eks-cluster/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
} 