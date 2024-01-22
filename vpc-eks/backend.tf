
terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "eks-app-tf-backend-storage"
    key     = "vpc/custom-vpc.tfstate"
    encrypt = true
  }
}


