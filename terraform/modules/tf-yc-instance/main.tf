resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-shkurko01"
    zone = var.zone
    platform_id = var.platform_id
    resources {
        cores  = 2
        memory = var.memory
    }
    scheduling_policy {
        preemptible = var.preemptible
    }
    boot_disk {
        initialize_params {
            image_id = var.image_id
        }
    }

    network_interface {
        subnet_id = "e9bg8cjovk4tpbk8h6m7"
        nat       = false
    }

    metadata = {
        user-data = "${file("./metadata.txt")}"
    }
}