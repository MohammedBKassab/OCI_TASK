resource "oci_load_balancer" "public_lb" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  shape          = "100Mbps"
  subnet_ids     = var.subnet_ids
  is_private     = false
}

resource "oci_load_balancer_backend_set" "lb_backend_set" {
  load_balancer_id = oci_load_balancer.public_lb.id
  name             = "lb-backend-set"
  policy           = var.policy
  
  health_checker {
    protocol = "HTTP"
    port     = 80
    url_path = "/"
  }
}
