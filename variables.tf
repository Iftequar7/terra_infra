variable "vpc_cidr_block" {
  type        = string
  description = "This variable is used to get the VPC CIDR range from user"
}

variable "pub_cidr_block" {
  type        = string
  description = "This variable is used to get the Pub Sub CIDR range from user"
}

variable "pvt_cidr_block" {
  type        = string
  description = "This variable is used to get the Pvt Sub CIDR range from user"
}
