//variable "network_zone" {
//  description = "Yandex.Cloud network availability zones"
//  type        = string
//  default     = "ru-central1-a"
//}
//
//data "yandex_vpc_network" "default" {
//  name = "default"
//}
//
//data "yandex_vpc_subnet" "default" {
//  name = "${data.yandex_vpc_network.default.name}-${var.network_zone}"
//}
//
//output "yandex_vpc_subnets" {
//  description = "Yandex.Cloud Subnets map"
//  value       = data.yandex_vpc_subnet.default
//}




#подключаем модуль сети
module "tf-yc-network" {
  source = "./modules/tf-yc-network"
}
#подключаем модуль виртуальных машин
module "tf-yc-instance" {
  source = "./modules/tf-yc-instance"
  vm_name = "chapter5-lesson02-shkurko"

#автоматически определяем id подсети на основе зоны
  subnet_id = "${module.tf-yc-network.yandex_vpc_subnet.id}"
}