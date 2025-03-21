data "oci_core_images" "ubuntu_latest" {
  compartment_id = var.compartment_ocid
  operating_system = "Canonical Ubuntu"
  sort_by = "TIMECREATED"
  sort_order = "DESC"
  filter {
    name = "display_name"
    regex = true
    values = ["^Canonical-Ubuntu-.*"]
  }
}


resource "oci_core_instance" "instance1" {
    compartment_id = var.compartment_id
    display_name = "instance1"
    shape = var.shape
    availability_domain = var.availability_domain
    source_details {
        source_type = "image"
        source_id = oci_core_images.ubuntu_latest.images.0.id
    }
    create_vnic_details {
        subnet_id = var.subnet_id
    }
}

resource "oci_core_instance" "instance2" {
    compartment_id = var.compartment_id
    display_name = "instance2"
    shape = var.shape
    availability_domain = var.availability_domain
    source_details {
        source_type = "image"
        source_id = oci_core_images.ubuntu_latest.images.0.id
    }
    create_vnic_details {
        subnet_id = var.subnet_id
    }
}