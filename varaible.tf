variable "provider_config" {
    type = map(string)
    sensitive = true
    default = {
        tenancy_ocid = ""
        user_ocid = ""
        fingerprint = ""
        private_key_path = ""
        region = ""
    }
}


variable "compartment_id" {
    type = string
    sensitive = true
  
}