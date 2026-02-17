locals {
  formatted=upper(replace(var.project_name," ","-"))


  newtags = merge(var.default_tags,var.environment_tags)

  formatted_buc = replace(replace(
    substr(lower(var.buc_name),0,63),
    " ","-"),"!","1"
  )

  port_list=split(",", var.allowed_ports)

  sg_rules=[ for port in local.port_list :
  {
    name = "port-${port}"
    port = port
    description = "Allow trafic on port ${port}"
  }
  ]

instance_size = lookup(var.instance_sizes,var.environment,"t2.micro")

}