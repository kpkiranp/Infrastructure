# Below block calls the VPC module for creation of VPC

module "vpc" {
    source = "./modules/vpc"
    environment          = "${var.root_environment}"
    vpc_cidr             = "${var.root_vpc_cidr}"
    public_subnets_cidr  = "${var.root_public_subnets_cidr}"
    private_subnets_cidr = "${var.root_private_subnets_cidr}"
    availability_zones   = tolist([data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]])
}

# Below block calls the eks-cluster module to create an eks cluster

module "eks-cluster" {
    source = "./modules/eks-cluster"
    environment = "${var.root_environment}"
    vpc_id = module.vpc.vpc_id
    eks_subnet_ids = module.vpc.public_subnet_ids
}

# Below block calls the create_key_pair module for creating the key pair

module "create_key_pair" {
  source = "./modules/create_key_pair"
  key_pair_key_name = var.root_key_pair_key_name
  key_pair_path = var.root_key_path
}

# Below block calls the Create_security_group module for creating the security group

module "create_security_group" {
  source = "./modules/create_security_group"
  jenkins_security_group_name = var.root_jenkins_security_group_name
  vpc_id = module.vpc.vpc_id
}

# Below block calls create_ec2_instance module for creating of ec2 instance for jenkins

module "create_ec2_instance" {
  source = "./modules/create_ec2_instance"
  ec2_ami_id = var.root_ami_id
  ec2_instance_type = var.root_instance_type
  ec2_key_name = module.create_key_pair.pem_key_pair_id
  ec2_security_group = module.create_security_group.security_group_id
  ec2_public_subnet_id = module.vpc.public_subnet_ids[0]
}

# Below block calls the provisioner module to install jenkins on the above created ec2 instance

module "install_jenkins_remote_exec" {
  source = "./modules/provisioner"
  host = module.create_ec2_instance.ec2_public_ip_address
  user = var.root_user
  ec2_pem = var.root_key_path
  src = var.root_src
  # dest = var.root_dest
}

# Below block calls the create_eks_ec2_instance module that creates an ec2 instance to interact with eks cluster

module "create_eks_ec2_instance" {
  source = "./modules/create_ec2_instance_EKS"
  ec2_ami_id = var.root_ami_id
  ec2_instance_type = var.root_instance_type
  ec2_key_name = module.create_key_pair.pem_key_pair_id
  ec2_security_group = module.create_security_group.security_group_id
  ec2_public_subnet_id = module.vpc.public_subnet_ids[0]
}