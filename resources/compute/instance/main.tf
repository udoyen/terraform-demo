resource "google_compute_instance" "default" {
  name         = var.compute_instance_name
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name

    access_config {
      // Ephemeral public IP
    }
  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_name
    scopes = ["cloud-platform"]
  }
}