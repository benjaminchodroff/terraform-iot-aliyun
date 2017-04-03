output "hostname_list" {
  value = "${join(",", alicloud_instance.instance.*.instance_name)}"
}

output "ecs_ids" {
  value = "${join(",", alicloud_instance.instance.*.id)}"
}

output "ecs_id_list" {
  value =  ["${alicloud_instance.instance.*.id}"]
}
