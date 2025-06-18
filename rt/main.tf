resource "aws_route" "this" {
  for_each = {
    for idx, route in var.routes :
    idx => route
  }

  route_table_id         = var.route_table_id
  destination_cidr_block = each.value.destination_cidr_block

  # Dynamically assign gateway_id, nat_gateway_id, or instance_id if provided
  gateway_id      = lookup(each.value, "gateway_id", null)
  nat_gateway_id  = lookup(each.value, "nat_gateway_id", null)
#  instance_id     = lookup(each.value, "instance_id", null)
  vpc_peering_connection_id = lookup(each.value, "vpc_peering_connection_id", null)
  network_interface_id       = lookup(each.value, "network_interface_id", null)
  transit_gateway_id         = lookup(each.value, "transit_gateway_id", null)
  egress_only_gateway_id     = lookup(each.value, "egress_only_gateway_id", null)
}
