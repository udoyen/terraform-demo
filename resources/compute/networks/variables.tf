variable "project_id" {
  type        = string
  description = "project id"
}

variable "vpc_network_name" {
  type        = string
  description = "vpc network name"
}

variable "firewall_name" {
  type        = string
  description = "firewall name"
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
}

variable "region" {
  type        = string
  description = "region"
}

variable "vpc_network" {}