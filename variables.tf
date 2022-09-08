variable "service_account_name" {
  type        = string
  description = "service account name"
  default     = "demo-service-account"
}

variable "subnet_name" {
  type    = string
  default = "demo-subnet-name"
}

variable "compute_instance_name" {
  type    = string
  default = "demo-compute-instance"
}

variable "vpc_name" {
  type    = string
  default = "demo-vpc"

}

variable "vpc_network_name" {
  type    = string
  default = "demo-vpc-network"
}

variable "firewall_name" {
  type    = string
  default = "demo-firewall"
}

variable "service_account_id" {
  type    = string
  default = "demo-service-account-2"
}