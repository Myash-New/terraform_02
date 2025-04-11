resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_network" "db" {
  name = var.vpc_db_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

#resource "yandex_compute_instance" "platform" {
#  for_each = var.vms_resources
#
#  name        = "${each.key}-web"
#  platform_id = var.vm_web_platform_id
#  
#  resources {
#    cores         = each.value.cores
#    memory        = each.value.memory
#    core_fraction = each.value.core_fraction
#  }

resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id

resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }



#resource "yandex_compute_instance" "platform" {
#  name        = local.vm_web_name
#  platform_id = var.vm_web_platform_id
#
#  resources {
#    cores         = var.vm_web_cores
#    memory        = var.vm_web_memory
#    core_fraction = var.vm_web_core_fraction
#  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat    
  }

#  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }

metadata = local.full_metadata

zone = var.web_zone
}


#db

resource "yandex_vpc_subnet" "db" {
  name           = var.vpc_db_name
  zone           = var.db_zone
  network_id     = yandex_vpc_network.db.id
  v4_cidr_blocks = var.db_cidr
}

#resource "yandex_compute_instance" "db" {
#  for_each = var.vms_resources
#  name        = "${each.key}-db"
#  platform_id = var.vm_db_platform_id
#  resources {
#    cores         = each.value.cores
#    memory        = each.value.memory
#    core_fraction = each.value.core_fraction
#  }

resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id

resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

#resource "yandex_compute_instance" "db" {
#  name        = local.vm_db_name
#  platform_id = var.vm_db_platform_id
#  resources {
#    cores         = var.vm_db_cores
#    memory        = var.vm_db_memory
#    core_fraction = var.vm_db_core_fraction
#  }
#
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = var.vm_db_nat
  }
 # metadata = {
 #   serial-port-enable = 1
 #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
 # }
 
  metadata = local.full_metadata

  zone = var.db_zone
}
