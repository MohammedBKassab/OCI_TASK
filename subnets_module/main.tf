resource "oci_core_subnet" "public_subnet1" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 1)
  display_name      = "public-subnet-1"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "public_subnet2" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 2)
  display_name      = "public-subnet-2"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private_subnet1" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 3)
  display_name      = "private-subnet-1"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "private_subnet2" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 4)
  display_name      = "private-subnet-2"
  prohibit_public_ip_on_vnic = true
}