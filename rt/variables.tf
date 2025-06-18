variable "route_table_id" {
  description = "Existing Route Table ID"
  type        = string
}

variable "routes" {
  description = "List of routes to add/update"
  type = list(object({
    destination_cidr_block      = string
    gateway_id                 = optional(string)
    nat_gateway_id             = optional(string)
    instance_id                = optional(string)
    vpc_peering_connection_id  = optional(string)
    network_interface_id       = optional(string)
    transit_gateway_id         = optional(string)
    egress_only_gateway_id     = optional(string)
  }))
}
