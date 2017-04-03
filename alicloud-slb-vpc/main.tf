resource "alicloud_slb" "https" {
  name = "${var.name}-https"
  vswitch_id = "${var.vswitch_id}"
  internet_charge_type = "${var.internet_charge_type}"
  listener = [
    {
      "instance_port" = "9443"
      "lb_port" = "443"
      "lb_protocol" = "https"
      "bandwidth" = -1
      #scheduler  =""
	#sticky_session= "on"
	#sticky_session_type="ServerStickySessionType"
	#cookie_timeout=60
	#cookie=
	#persistence_timeout=
	#health_check="on"
	#"health_check_type"="HTTPHealthCheckType"
	#health_check_domain
	#health_check_uri
	#health_check_connect_port
	#healthy_threshold
	#unhealthy_threshold
	#health_check_timeout
	#health_check_interval
	#health_check_http_code
      "ssl_certificate_id" = "${var.ssl_certificate_id}"
    },
   ]
}

resource "alicloud_slb" "mqtt" {
  name = "${var.name}-mqtt"
  vswitch_id = "${var.vswitch_id}"
  internet_charge_type = "${var.internet_charge_type}"
  listener = [
    {
     "instance_port" = "8883"
     "lb_port" = "8883"
     "lb_protocol" = "tcp"
     "bandwidth" = -1
    },
   ]
}

resource "alicloud_slb_attachment" "mqtt-worker" {
  slb_id    = "${alicloud_slb.mqtt.id}"
  instances = ["${var.worker_instances}"]
}

resource "alicloud_slb_attachment" "https-control" {
  slb_id    = "${alicloud_slb.https.id}"
  instances = ["${var.control_instances}"]
}

