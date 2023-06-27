
variable "root_region" {
  type=string
}

variable "root_environment" {
  type=string
}

variable "root_vpc_cidr" {
  type=string
}

variable "root_public_subnets_cidr" {
  type=list(any)
}

variable "root_private_subnets_cidr" {
  type=list(any)
}

variable "root_ami_id" {
  type = string
}

variable "root_instance_type" {
  type = string
}

variable "root_key_pair_key_name" {
  type = string
}

variable "root_jenkins_security_group_name" {
  type = string
}

variable "root_user" {
  type = string
}

variable "root_key_path" {
  type = string
}

variable "root_src" {
  type = string
}

# variable "root_dest" {
#   type = string
# }


