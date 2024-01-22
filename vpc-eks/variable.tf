variable "region" {
  description = "AWS region where resources will be created"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "A map of tags to assign to the VPC"
  default = {
    "Name"  = "vpc-main"
    "Owner" = "Terraform"
  }
}

variable "vpc_name" {
  description = "The value of the 'Name' tag for the VPC"
  default     = "vpc-main"
}

variable "public-subnet-zone1" {
  type        = string
  default     = "us-east-1a"
  description = "The Availability Zone for the first public subnet"
}

variable "public-subnet-zone2" {
  type        = string
  default     = "us-east-1b"
  description = "he Availability Zone for the second public subnet"
}

variable "public-cidr1" {
  type        = string
  default     = "10.0.64.0/19"
  description = "The CIDR block for the first public subnet"
}

variable "public-cidr2" {
  type        = string
  default     = "10.0.96.0/19"
  description = "The CIDR block for the second public subnet"
}

variable "private-subnet-zone1" {
  type        = string
  default     = "us-east-1a"
  description = "The Availability Zone for the first private subnet"
}

variable "private-subnet-zone2" {
  type        = string
  default     = "us-east-1b"
  description = "The Availability Zone for the second private subnet"
}

variable "private-cidr1" {
  type        = string
  default     = "10.0.0.0/19"
  description = "The CIDR block for the first private subnet"
}

variable "private-cidr2" {
  type        = string
  default     = "10.0.32.0/19"
  description = "The CIDR block for the second private subnet"
}
#variable "private-zone-name" { description = "private hosted zone" }

variable "eks_name" {
  default     = "eks-poc"
  description = "The name of the EKS cluster"
}

variable "eks_version" {
  default     = 1.28
  description = "The desired version of the EKS cluster"
}

