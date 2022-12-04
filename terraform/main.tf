terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gt260mflvge5lvm7ge"
  zone      = "ru-central1-a"
}
variable "network_zone" {
  description = "Yandex.Cloud network availability zones"
  type        = string
  default     = "ru-central1-a"
}

data "yandex_vpc_network" "default" {
  name = "default"
}

data "yandex_vpc_subnet" "default" {
  name = "${data.yandex_vpc_network.default.name}-${var.network_zone}"
}

output "yandex_vpc_subnets" {
  description = "Yandex.Cloud Subnets map"
  value       = data.yandex_vpc_subnet.default
}
resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-ishkurko"

    resources {
        cores  = 2
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = "fd80qm01ah03dkqb14lc"
        }
    }

    network_interface {
        subnet_id = "e9bg8cjovk4tpbk8h6m7"
        nat       = false
    }

    metadata = {
        user-data = "${file("<./metadata.txt")}"
    }
}
output "ip_address" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
