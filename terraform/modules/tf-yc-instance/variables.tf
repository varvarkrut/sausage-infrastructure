variable platform_id {
  type = string
  description = "Platform identification"
  default = "standard-v1"
}

variable zone {
  type = string
  description = "Zone identification"
  default = "ru-central1-a"
}

variable preemptible {
  description = "virtual machine interruptibility"
  type = bool
  default = true
}

variable memory {
  description = "Memory capacity"
  type = number
  default = 2
}
