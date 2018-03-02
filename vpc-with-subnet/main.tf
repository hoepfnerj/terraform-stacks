provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  #source = "github.com/hoepfnerj/terraform-modules.git//vpc?ref=v0.0.2"
  source = "../../../terraform-modules/vpc"
  
  vpc_cidr_block = "10.200.0.0/16"
}

module "subnet" {
  #source = "github.com/hoepfnerj/terraform-modules.git//subnet?ref=v0.0.2"
  source = "../../../terraform-modules/subnet"
  
  vpc_id = "${module.vpc.vpc_id}"
  subnet_cidr = "${var.subnet_cidr}"
  subnet_availability_zone = "${var.subnet_availability_zone}"
}