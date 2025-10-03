variable "oci_core_instance_ssh_authorized_keys" {
  type = string
  description = "Provide one or more public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance. Use a newline character to separate multiple keys"
}

resource "oci_core_vcn" "dhjensen-vcn-001" {
  cidr_blocks      = ["10.0.0.0/16"]
  compartment_id   = var.oci_tenancy_ocid
  display_name     = "dhjensen-vcn-001"
  dns_label        = "dhjensenvcn001"
  is_ipv6enabled   = "false"
}
resource "oci_core_subnet" "dhjensen-subnet-001" {
  cidr_block                  = "10.0.0.0/24"
  compartment_id              = var.oci_tenancy_ocid
  display_name                = "dhjensen-subnet-001"
  dns_label                   = "dhjensensubnet"
  prohibit_internet_ingress   = false
  prohibit_public_ip_on_vnic  = false
  security_list_ids           = [oci_core_security_list.dhjensen-security-list-001.id]
  vcn_id                      = oci_core_vcn.dhjensen-vcn-001.id
}
resource "oci_core_security_list" "dhjensen-security-list-001" {
  compartment_id              = var.oci_tenancy_ocid
  display_name                = "dhjensen-security-list-001"
  vcn_id                      = oci_core_vcn.dhjensen-vcn-001.id
}
resource "oci_core_network_security_group" "dhjensen-network-security-group-001" {
  compartment_id    = var.oci_tenancy_ocid
  vcn_id            = oci_core_vcn.dhjensen-vcn-001.id
  display_name      = "dhjensen-network-security-group-001"
}
resource "oci_core_network_security_group_security_rule" "dhjensen-network-security-group-rule-001" {
  network_security_group_id = oci_core_network_security_group.dhjensen-network-security-group-001.id
  direction                 = "INGRESS"
  protocol                  = 6
  description               = "Only allow SSH from 87.61.92.76"
  source                    = "87.61.92.76/32"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}
resource "oci_core_route_table" "dhjensen-route-table-001" {
  compartment_id      = var.oci_tenancy_ocid
  display_name        = "dhjensen-route-table-001"
  route_rules {
    description       = "Default Internet Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.dhjensen-internet-gateway-001.id
    route_type        = "STATIC"
  }
  vcn_id              = oci_core_vcn.dhjensen-vcn-001.id
}
resource "oci_core_route_table_attachment" "dhjensen-route-table-attachment-001" {
  subnet_id       = oci_core_subnet.dhjensen-subnet-001.id
  route_table_id  = oci_core_route_table.dhjensen-route-table-001.id
}
resource "oci_core_internet_gateway" "dhjensen-internet-gateway-001" {
  compartment_id    = var.oci_tenancy_ocid
  display_name      = "dhjensen-internet-gateway-001"
  enabled           = true
  vcn_id            = oci_core_vcn.dhjensen-vcn-001.id
}
resource "oci_core_instance" "dhjensen-instance-001" {
  agent_config {
    is_management_disabled = false
    is_monitoring_disabled = true
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Custom Logs Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute RDMA GPU Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Auto-Configuration"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Authentication"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Cloud Guard Workload Protection"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = "LiDo:EU-FRANKFURT-1-AD-3"
  compartment_id      = var.oci_tenancy_ocid
  create_vnic_details {
    assign_ipv6ip             = false
    assign_private_dns_record = true
    assign_public_ip          = true
    hostname_label            = "instance-001"
    nsg_ids                   = [oci_core_network_security_group.dhjensen-network-security-group-001.id]
    subnet_id                 = oci_core_subnet.dhjensen-subnet-001.id
  }
  display_name        = "dhjensen-instance-001"
  instance_options {
    are_legacy_imds_endpoints_disabled = false
  }
  is_pv_encryption_in_transit_enabled = true
  launch_volume_attachments {
    display_name  = "dhjensen-volume-001"
    launch_create_volume_details {
      display_name          = "dhjensen-volume-001"
      size_in_gbs           = "50"
      volume_creation_type  = "ATTRIBUTES"
      vpus_per_gb           = 0
    }
    type          = "paravirtualized"
  }
  metadata = {
    "ssh_authorized_keys" = var.oci_core_instance_ssh_authorized_keys
  }
  shape = "VM.Standard.E2.1.Micro"
#   shape_config {
#     memory_in_gbs = "12"
#     ocpus = "2"
#   }
  source_details {
    boot_volume_vpus_per_gb         = 10
    instance_source_image_filter_details {
      compartment_id            = var.oci_tenancy_ocid
      operating_system          = "Canonical Ubuntu 24.04 Minimal"
      operating_system_version  = "24.04"
    }
    #source_id                      = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaqnd47pb5voquvoszcyk3fj4n5tytijwvcflpwhnao77ffijjncgq"
    source_id                       = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaw4xh4y7qlp2czj5lwduyxuwdln3nuav3xpqsyzmfuhmrvaelayka"
    source_type                     = "image"
    is_preserve_boot_volume_enabled = false
  }
  state = "RUNNING"
}
