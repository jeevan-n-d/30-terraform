output "formatted_name" {
  value = local.formatted
}

output "post_list" {
  value = local.port_list
}

output "sg_rules" {
  value = local.sg_rules
}

output "instance_sizez" {
  value = local.instance_size
}

output "credentials" {
  value = var.credentials
}

output "all_locations" {
  value = local.all_locations
}

output "uni_locations" {
  value=local.unique_locations
}

output "pos_cost" {
  value = local.pos_cost
}

output "max_cost" {
  value = local.max_cost
}

output "min_cost" {
  value = local.min_cost
}

output "total_cost" {
  value = local.total_cost
}

output "avg_cost" {
  value = local.avg_cost
}

output "config" {
  value=local.config_data
}