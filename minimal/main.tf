# Create a new ECS instance for classic
resource "alicloud_security_group" "vpc" {
  name        = "tf_test_foo"
  vpc_id = "${alicloud_vpc.vpc.id}"
}

resource "alicloud_security_group_rule" "allow_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = "${alicloud_security_group.vpc.id}"
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_instance" "classic" {
  availability_zone = "cn-shanghai-a"
  security_groups = ["${alicloud_security_group.vpc.id}"]
  allocate_public_ip = false
  instance_type        = "ecs.xn4.small"
  io_optimized         = "optimized"
  system_disk_category = "cloud_efficiency"
  image_id             = "ubuntu_140405_64_40G_cloudinit_20161115.vhd"
  instance_name        = "test_foo"
  #internet_charge_type = "PayByTraffic"
  #internet_max_bandwidth_out = "100"
  #internet_max_bandwidth_in = "200"
  vswitch_id = "${alicloud_vswitch.vsw.id}" 
  instance_charge_type = "PostPaid"
  password = "Test12345"
}

resource "alicloud_vpc" "vpc" {
  name       = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}


resource "alicloud_vswitch" "vsw" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  cidr_block        = "172.16.0.0/21"
  availability_zone = "cn-shanghai-a"
}


