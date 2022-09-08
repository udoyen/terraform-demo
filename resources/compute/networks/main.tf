resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network
  auto_create_subnetworks = false
  mtu                     = 1460
}


resource "google_compute_subnetwork" "demo_subnet" {
  name          = var.subnet_name
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.id

}

resource "google_compute_firewall" "demo_firewall" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}