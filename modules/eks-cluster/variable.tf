# Variables called in different configurations of eks-cluster module
variable "eks_subnet_ids" {
  type = list(any)
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}