# outputs.tf
output "vm_instances" {
  description = "Details of all created VMs"
  value = {
   
    (yandex_compute_instance.platform.name) = {
      instance_name = yandex_compute_instance.platform.name
      external_ip   = yandex_compute_instance.platform.network_interface[0].nat_ip_address
      fqdn          = yandex_compute_instance.platform.fqdn
    }
    
    (yandex_compute_instance.db.name) = {
      instance_name = yandex_compute_instance.db.name
      external_ip   = yandex_compute_instance.db.network_interface[0].nat_ip_address
      fqdn          = yandex_compute_instance.db.fqdn
    }
  }
}