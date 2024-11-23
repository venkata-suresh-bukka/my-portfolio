#GKE Cluster.....................................................................................
variable "project_id" {
  type        = string
  description = "GCP Project Id"
}

variable "cluster_name" {
  type        = string
  description = "name of the cluster"
}

variable "network" {
  type        = string
  description = "VPC network for the cluster"
}

variable "subnetwork" {
  type        = string
  description = "vpc subnetwork"
}

variable "location" {
  type        = string
  description = "location of the cluster whether regional or zonal"
}

variable "remove_default_node_pool" {
  type        = bool
  description = "if true, default node pool will be deleted."

}

variable "vertical_pod_autoscaling" {
  type = bool
  description = "whether to enable vertical pod auoscaling"
  
}


variable "release_channel" {
  type        = string
  description = "Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters."
}

variable "enable_binary_authorization" {
  type        = string
  description = "Enable Binary Authorization for this cluster. If enabled, all container images will be validated by Google Binary Authorization."
}

variable "enable_shielded_nodes" {
  type        = bool
  description = "Enable Shielded Nodes features on all nodes in this cluster."
}

variable "resource_labels" {
  type    = map(string)
  default = {}
}

variable "enable_intranode_visibility" {
  type    = bool
  default = false

}

variable "enable_private_endpoint" {
  type        = bool
  description = "When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled."
}

variable "enable_private_nodes" {
  type        = bool
  description = "Enables the private cluster feature, creating a private endpoint on the cluster."
}

variable "logging_service" {
  type        = string
  description = "The logging service that the cluster should write logs to."

}

variable "monitoring_service" {
  type        = string
  description = "The monitoring service that the cluster should write metrics to."

}

variable "maintenance_start_time" {
  type        = string
  description = "The start time's date is the initial date that the window starts."

}

variable "maintenance_end_time" {
  type        = string
  description = "The end time is used for calculating duration."

}

variable "recurrence" {
  type        = string
  description = "Specify recurrence in RFC5545 RRULE format, to specify when this recurs."

}

variable "create_timeout" {
  type        = string
  description = "create timeout value"

}

variable "update_timeout" {
  type        = string
  description = "update timeout value"

}

