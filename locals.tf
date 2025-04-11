locals {
  vm_web_name = "${var.vm_web_name}-${var.web_zone}-web"
  vm_db_name = "${var.vm_db_name}-${var.db_zone}-db"
}


locals {
  full_metadata = merge(
    var.metadata,
    { 
      ssh-keys = "ubuntu:${var.vms_ssh_root_key}" 
    }
  )
}
