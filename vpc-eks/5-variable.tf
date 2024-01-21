variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tags" {
  description = "VPC tags name"
  default = {
    "Name"  = "vpc-main"
    "Owner" = "Terraform"
  }
}

variable "vpc_name" {
  description = "VPC NAME"
  default     = "vpc-main"
}

variable "public-subnet-zone1" {
  type        = string
  default     = "us-east-1a"
  description = "List the public subnet zone name, it must be same count as cidr"
}

variable "public-subnet-zone2" {
  type        = string
  default     = "us-east-1b"
  description = "List the public subnet zone name, it must be same count as cidr"
}

variable "public-cidr1" {
  type        = string
  default     = "10.0.64.0/19"
  description = "List the public subnet CIDR it must be same count as zone name"
}

variable "public-cidr2" {
  type        = string
  default     = "10.0.96.0/19"
  description = "List the public subnet CIDR it must be same count as zone name"
}

variable "private-subnet-zone1" {
  type        = string
  default     = "us-east-1a"
  description = "List the private subnet zone name, it must be same count as cidr"
}

variable "private-subnet-zone2" {
  type        = string
  default     = "us-east-1b"
  description = "List the private subnet zone name, it must be same count as cidr"
}

variable "private-cidr1" {
  type        = string
  default     = "10.0.0.0/19"
  description = "List the private subnet CIDR it must be same count as zone name"
}

variable "private-cidr2" {
  type        = string
  default     = "10.0.32.0/19"
  description = "List the private subnet CIDR it must be same count as zone name"
}
#variable "private-zone-name" { description = "private hosted zone" }

variable "eks_name" {
  default = "eks-poc"
}

variable "eks_version" {
  default = 1.28
}

