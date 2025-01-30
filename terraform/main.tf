provider "aws" {
  region = var.region
}

module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = var.vpc_cidr
}

module "subnet" {
  source               = "./modules/subnet"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone    = var.availability_zone
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source           = "./modules/route_table"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnet.public_subnet_id
  gateway_id       = module.internet_gateway.internet_gateway_id
}

module "private_route_table" {
  source           = "./modules/route_table"
  vpc_id           = module.vpc.vpc_id
  private_subnet_id = module.subnet.private_subnet_id
  nat_gateway_id    = module.nat_gateway.nat_gateway_id  
  public_subnet_id = module.subnet.public_subnet_id  
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "github_runner" {
  source               = "./modules/ec2_github_runner"
  ami_id               = "ami-02972a2a0ac299bb7"  # Amazon Linux AMI ID
  instance_type        = var.instance_type
  public_subnet_id     = module.subnet.public_subnet_id
  security_group_id    = module.security_group.public_sg_id
  github_token_secret_id = var.github_token_secret_id
  github_owner         = var.github_owner
  github_repo          = var.github_repo
  ec2_role_arn         = module.iam_role.iam_role_arn
}

module "nat_gateway" {
  source             = "./modules/nat_gateway"
  public_subnet_id   = module.subnet.public_subnet_id
  eip_allocation_id  = module.nat_eip.eip_allocation_id 
  vpc_id            = module.vpc.vpc_id
}
