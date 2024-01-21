terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "eks-app-tf-backend-storage"
    key     = "eks/eks-poc.tfstate"
    encrypt = true
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "us-east-1"
    bucket = "eks-app-tf-backend-storage"
    key    = "vpc/custom-vpc.tfstate"
  }
}
