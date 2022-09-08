
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.35.0"
    }
  }
}

locals {
  project_id = "qwiklabs-gcp-04-4e423c4d3675"
  region     = "us-central1"
  zone       = "us-central1-a"
}

provider "google-beta" {
  project     = local.project_id
  region      = local.region
  zone        = local.zone
  credentials = "./qwiklabs-gcp-04-4e423c4d3675-601f52abea67.json"

}

provider "google" {
  project     = local.project_id
  region      = local.region
  zone        = local.zone
  credentials = "./qwiklabs-gcp-04-4e423c4d3675-601f52abea67.json"
}


module "instance" {
  source                = "./resources/compute/instance"
  service_account_name  = module.service_account.service_account_email
  subnet_name           = module.network.subnet
  vpc_name              = module.network.network_name
  zone                  = local.zone
  compute_instance_name = var.compute_instance_name
}

module "network" {
  source           = "./resources/compute/networks"
  project_id       = local.project_id
  vpc_network_name = var.vpc_network_name
  firewall_name    = var.firewall_name
  region           = local.region
  subnet_name      = var.subnet_name
  vpc_network      = var.vpc_name

}

module "service_account" {
  source                       = "./resources/iam"
  service_account_display_name = var.service_account_name
  service_account_id           = var.service_account_id
}