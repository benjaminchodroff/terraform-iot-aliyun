resource "alicloud_security_group" "default" {
  name = "${var.short_name}-default"
  description = "Default security group for VPC"
  vpc_id = "${var.vpc_id}"
}

resource "alicloud_security_group" "control" {
  name = "${var.short_name}-control"
  description = "Allow inboud traffic for control nodes"
  vpc_id = "${var.vpc_id}"
}

resource "alicloud_security_group" "edge" {
  name = "${var.short_name}-edge"
  description = "Allow inboud traffic for edge routing"
  vpc_id = "${var.vpc_id}"
}

resource "alicloud_security_group" "worker" {
  name = "${var.short_name}-worker"
  description = "Allow inboud traffic for worker nodes"
  vpc_id = "${var.vpc_id}"
}

# All firewalls rules must be commented with the following format:
# Ticket - ChangeDate - approveremail - [Allow/Deny] "protocol" to "security group/ip" from "security group/ip" for "business purpose"

# 0 - 20170402 - benjamin.chodroff@sevenstarworld.cn - Allow http to the default group from the world for the load balancer traffic
resource "alicloud_security_group_rule" "http-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "intranet"
  policy = "accept"
  port_range = "80/80"
  priority = 1
  security_group_id = "${alicloud_security_group.default.id}"
  cidr_ip = "0.0.0.0/0"
}

# 0 - 20170402 - benjamin.chodroff@sevenstarworld.cn - Allow https to the default group from the world for the load balancer traffic
resource "alicloud_security_group_rule" "default-https-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "intranet"
  policy = "accept"
  port_range = "443/443"
  priority = 1
  security_group_id = "${alicloud_security_group.default.id}"
  cidr_ip = "0.0.0.0/0"
}

# 0 - 20170402 - benjamin.chodroff@sevenstarworld.cn - Allow ssh to the edge group from the world for remote bastion host control
# TODO: replace cidr_ip with IPSec tunnel address only
resource "alicloud_security_group_rule" "edge-ssh-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "intranet"
  policy = "accept"
  port_range = "22/22"
  priority = 1
  security_group_id = "${alicloud_security_group.edge.id}"
  cidr_ip = "0.0.0.0/0"
}

# 0 - 20170402 - benjamin.chodroff@sevenstarworld.cn - Allow ssh to control from local edge for bastion host control
resource "alicloud_security_group_rule" "control-ssh-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "intranet"
  policy = "accept"
  port_range = "22/22"
  priority = 1
  security_group_id = "${alicloud_security_group.control.id}"
  source_security_group_id = "${alicloud_security_group.edge.id}"
}

# 0 - 20170402 - benjamin.chodroff@sevenstarworld.cn - Allow ssh to worker froms local edge for bastion host control
resource "alicloud_security_group_rule" "worker-ssh-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "intranet"
  policy = "accept"
  port_range = "22/22"
  priority = 1
  security_group_id = "${alicloud_security_group.worker.id}"
  source_security_group_id = "${alicloud_security_group.edge.id}"
}

# 0 - 20170402 - benjamin.chodroff@sevenstarworld.cn - Allow edge (bastion host) access to the public intranet 
resource "alicloud_security_group_rule" "edge-all-out" {
  type = "egress"
  ip_protocol = "all"
  nic_type = "intranet"
  policy = "accept"
  port_range = "-1/-1"
  priority = 1
  security_group_id = "${alicloud_security_group.edge.id}"
  cidr_ip = "0.0.0.0/0"
}

