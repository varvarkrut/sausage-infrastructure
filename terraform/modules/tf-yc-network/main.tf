#хардкодим имя сети
data "yandex_vpc_network" "default" {
  name = "default"
}

#вытаскиваем id подсети (которая относится к сети default) в указанной зоне
data "yandex_vpc_subnet" "default" {
  name = "${data.yandex_vpc_network.default.name}-${var.zone_list}"
}