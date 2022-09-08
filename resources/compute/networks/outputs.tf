output "network_name" {
  value = google_compute_network.vpc_network.self_link
}

output "subnet" {
  value = google_compute_subnetwork.demo_subnet.self_link
}