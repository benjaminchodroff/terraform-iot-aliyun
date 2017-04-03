resource "alicloud_vpc" "main" {
  name = "${var.long_name}"
  cidr_block = "${var.vpc_cidr}"
}

resource "alicloud_vswitch" "main" {
  vpc_id = "${alicloud_vpc.main.id}"
  count = "${length(split(",", var.availability_zones))}"
  cidr_block = "${lookup(var.cidr_blocks, "az${count.index}")}"
  availability_zone = "${var.availability_zones}"
  depends_on = [
    "alicloud_vpc.main"]
}

resource "alicloud_nat_gateway" "main" {
  vpc_id = "${alicloud_vpc.main.id}"
  spec = "Small"
  bandwidth_packages = [
    {
      ip_count = 1
      bandwidth = 2
      zone = "${var.availability_zones}"
    }
  ]
  depends_on = [
    "alicloud_vswitch.main"]
}

# TODO: this type of resource does not exist today - must build into terraform!
#resource "alicloud_nat_gateway_port_forwarding" "edge-ssh-forward" {
#  external_eip_id = "${alicloud_vpc.main.eip.id}" # <-- this is wrong
#  instance_id = "${alicloud_instance.instances.edge.id}" #<-- this is wrong
#  exteranal_ports = "22/22"
#  internal_ports = "22/22"
#  protocal_type = "tcp"
#}
