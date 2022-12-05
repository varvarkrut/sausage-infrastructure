#выдаем объект подсети
output "yandex_vpc_subnet" {
  description = "Yandex.Cloud Subnet id"
  value       = data.yandex_vpc_subnet.default
}