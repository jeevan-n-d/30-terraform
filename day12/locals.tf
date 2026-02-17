locals {
  formatted=upper(replace(var.project_name," ","-"))


  newtags = merge(var.default_tags,var.environment_tags)

  formatted_buc = replace(replace(
    substr(lower(var.buc_name),0,63),
    " ","-"),"!","1"
  )

  port_list = [for p in split(",", var.allowed_ports) : tonumber(p)]


  sg_rules=[ for port in local.port_list :
  {
    name = "port-${port}"
    port = port
    description = "Allow trafic on port ${port}"
  }
  ]

instance_size = lookup(var.instance_sizes,var.environment,"t2.micro")

all_locations=concat(var.user_locations,var.default_locations)

unique_locations=toset(local.all_locations)

pos_cost = [ for cost in var.monthly_costs : abs(cost) ]



max_cost=max(local.pos_cost...)
min_cost=min(local.pos_cost...)
total_cost=sum(local.pos_cost)
avg_cost=local.total_cost / length(local.pos_cost)

current_timestamp=timestamp()
format1=formatdate("YYYYMMdd",local.current_timestamp)
format2=formatdate("YYYY-MM-DD",local.current_timestamp)
timestamp_name="back-up-${local.format1}"

config_file_exits = fileexists("./config.json")
config_data=local.config_file_exits ? jsondecode(file("./config.json")) : {}

}