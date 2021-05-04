variable "assume_role_arn" {
  description = "The role to assume when accessing the AWS API."
  default     = ""
}

variable "account_aurora_endpoint" {
  description = "account aurora endpoint for write"
}

variable "account_aurora_reader_endpoint" {
  description = "account aurora reader endpoint for RO"
}
