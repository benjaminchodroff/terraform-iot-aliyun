variable "count" {
  default = "1"
}
variable "count_format" {
  default = "%04d"
}
variable "image_id" {
  default = "centos_6_8_64_40G_base_20170222.vhd"
}

variable "role" {
}
variable "datacenter" {
}
variable "short_name" {
  default = "hi"
}
variable "ecs_type" {
}
variable "ecs_password" {
  default = "Test12345"
}
variable "availability_zones" {
}
variable "security_groups" {
  type    = "list"
}
variable "ssh_username" {
  default = "root"
}

//if instance_charge_type is "PrePaid", then must be set period, the value is 1 to 30, unit is month
variable "instance_charge_type" {
  default = "PostPaid"
}

variable "system_disk_category" {
  default = "cloud_efficiency"
}

# Set this to PayByBandwidth for VPC!
variable "internet_charge_type" {
  default = "PayByBandwidth"
#  default = "PayByTraffic"
}

# Do not set this in a VPC or public ip will get set
variable "internet_max_bandwidth_out" {
  default = 1
}

# Do not set this in a VPC or public ip will get set
variable"internet_max_bandwidth_in" {
  default = 1
#  default = 0
}

variable "io_optimized" {
  default = "optimized"
}

# Set this to false AND ensure internet_charge_type is set to PayByBandwidth or a public ip will get assigned
variable "allocate_public_ip" {
  default = "false"
}

variable "disk_category" {
  default = "cloud_ssd"
}
variable "disk_size" {
  default = "40"
}
variable "device_name" {
  default = "/dev/xvdb"
}

variable "vswitch_id" {
  default = ""
}
