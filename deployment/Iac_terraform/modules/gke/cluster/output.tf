output "cluster" {
  value = google_container_cluster.cluster.id

}

output "cluster-location" {
  value = google_container_cluster.cluster.location
  
}