#подключаем модуль сети
module "tf-yc-network" {
  source = "./modules/tf-yc-network"
}
#подключаем модуль виртуальных машин
module "tf-yc-instance" {
  source = "./modules/tf-yc-instance"
  zone = var.zone
  image_id = var.image_id
#автоматически определяем id подсети на основе зоны
  subnet_id = module.tf-yc-network.yandex_vpc_subnet["${module.tf-yc-instance.choosed_zone}"].subnet_id
}