variable "availability_zones" {
  default = "cn-shanghai-a"
}

variable "cidr_blocks" {
  type = "map"
  default = {
    az0 = "10.1.1.0/24"
    az1 = "10.1.2.0/24"
    az2 = "10.1.3.0/24"
  }
}

variable "long_name" {
  default = "IoTAutoVPC"
}
variable "short_name" {
  default = "IoTAuto"
}
variable "vpc_cidr" {
  default = "10.1.0.0/21"
}
variable "region" {
  default = "cn-shanghai"
}
