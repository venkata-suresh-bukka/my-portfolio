#Pubsub_notification..............................................................................
resource "google_pubsub_topic" "topic" {
  project = var.project_id
  name    = var.pubsub_topic

}