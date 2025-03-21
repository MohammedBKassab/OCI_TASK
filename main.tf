provider "oci" {
    tenancy_ocid = var.provider_config["tenancy_ocid"]
    user_ocid = var.provider_config["user_ocid"]
    fingerprint = var.provider_config["fingerprint"]
    private_key_path = var.provider_config["private_key_path"]
    region = var.provider_config["region"]
}

module "vcn" {
  source          = "./modules/vcn_module"
  compartment_id  = var.compartment_id
  vcn_cidr        = var.vcn_cidr
  vcn_display_name = "WIND-vCN"
}

module "subnets" {
  source         = "./modules/subnets"
  vcn_id         = module.vcn.vcn_id
  compartment_id = var.compartment_id
  vcn_cidr       = var.vcn_cidr
}

module "gateways" {
  source         = "./modules/gateways"
  vcn_id         = module.vcn.vcn_id
  compartment_id = var.compartment_id
  public_subnet_ids = [
    module.subnets.public_subnet1_id,
    module.subnets.public_subnet2_id
  ]
}

module "load_balancer" {
  source         = "./modules/load_balancer"
  compartment_id = var.compartment_id
  subnet_ids     = [
    module.subnets.public_subnet1_id,
    module.subnets.public_subnet2_id
  ]
}

module "compute" {
  source         = "./modules/compute"
  compartment_id = var.compartment_id
  subnet_ids     = [
    module.subnets.private_subnet1_id,
    module.subnets.private_subnet2_id
  ]
}