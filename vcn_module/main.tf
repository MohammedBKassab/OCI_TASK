resource "oci_core_vcn" "VCN" {
  compartment_id = var.compartment_id
  cidr_blocks    = [var.vcn_cidr]
  display_name   = var.vcn_display_name
}
 
resource "oci_core_internet_gateway" "IGW" {
  compartment_id = var.compartment_id
  display_name   = var.igw_display_name
  vcn_id         = oci_core_vcn.VCN.id
}

resource "oci_core_route_table" "RT" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = var.rt_display_name
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.IGW.id
  }
}

resource "oci_core_nat_gateway" "NATGW" {
  compartment_id = var.compartment_id
  vcn_id         = var.vpc_id
  display_name   = "nat-gateway"
}

