resource "aws_security_group_rule" "ingress" {
  for_each = {
    for idx, rule in var.ingress_rules :
    idx => rule
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = var.security_group_id
  description       = each.value.description
}
