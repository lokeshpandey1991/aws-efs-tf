locals {
  subnet1 = "10.0.1.0/24"
  subnet2 = "10.0.16.0/24"
  subnet3 = "10.0.48.0/24"
}

variable "port" {
  default = "2049"
}
variable "az-1" {
  default = "ap-south-1a"
}
variable "az-2" {
  default = "ap-south-1b"
}

variable "az-3" {
  default = "ap-south-1c"
}
