output "network" {
  value = google_compute_network.vpc-network[0].id

}

output "subnet" {
  value = google_compute_subnetwork.subnets[0].id

}

output "subnet_region" {
  value = google_compute_subnetwork.subnets[0].region

}