variable "ingress_rules" {
  description = "List of ingress rules to allow"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = []
}

variable "security_group_id" {
  description = "Existing Security Group ID"
  type        = string
  default     = "sg-093ddc2dfbf772209"
}
