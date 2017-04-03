variable "vswitch_id" {
}

variable "ssl_certificate_id" {
# terraform currently does not support uploading the slb certificate
# upload it manually prior to deploying the slb
# you can do so here: https://slbnew.console.aliyun.com/#/certificate/  (make sure it is in the same region as your slb)
}

variable "internet_charge_type" {
  default = "paybytraffic"
}

variable "name" {
  default = "slb_iot"
}

variable "worker_instances" {
  type    = "list"
}

variable "control_instances" {
  type    = "list"
}

