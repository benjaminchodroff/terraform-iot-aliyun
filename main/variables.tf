variable "ecs_password" {
  default = "Cl3@r0bject!"
}

variable "control_count" {
  default = "2"
}
variable "control_count_format" {
  default = "%04d"
}
variable "control_ecs_type" {
  default = "ecs.xn4.small"
}
variable "control_disk_size" {
  default = "40"
}

variable "edge_count" {
  default = "1"
}
variable "edge_count_format" {
  default = "%04d"
}
variable "edge_ecs_type" {
  default = "ecs.xn4.small"
}

variable "worker_count" {
  default = "2"
}
variable "worker_count_format" {
  default = "%04d"
}
variable "worker_ecs_type" {
  default = "ecs.xn4.small"
}

variable "short_name" {
  default = "iot"
}
variable "ssh_username" {
  default = "root"
}

variable "region" {
  default = "cn-shanghai"
}

variable "availability_zones" {
  default = "cn-shanghai-a"
}

variable "datacenter" {
  default = "shanghai"
}

# Terraform does not support uploading ssl certificates to aliyun
# You can do so manually here: https://slbnew.console.aliyun.com/#/certificate/
# You must do this in the same region as your slb prior to deploying your slb
# If you forget or set this incorrectly, you must taint your slb and try again:
# terraform taint -module=slb alicloud_slb.instance
# terraform apply
variable "ssl_certificate_id" {
  default = "1743551359077773_15b31892267_-423337873_1434170929"
}
