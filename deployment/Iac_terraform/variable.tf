# variable "credentials" {
#   type        = string
#   description = "Credential Json file"
# }

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

#VPC_Network
variable "vpc" {
  type        = list(string)
  description = "Network resource"
}

variable "auto_create_subnetworks" {
  type        = string
  description = "Boolean value whether to create subnets automatically or not"
}


#Subnets:
variable "subnets" {
  type        = list(string)
  description = "VPC subnetwork"
}

variable "subnet_regions" {
  type        = list(string)
  description = "Subnet deployment region"
}

variable "cidr_range" {
  type        = list(string)
  description = "IP address range"
}

variable "aggregation_interval" {
  type        = string
  description = "Toggles the aggregation interval for collecting flow logs"
}

variable "flow_sampling" {
  type        = string
  description = "Flow sampling for subnet logs"
}

variable "subnet_metadata" {
  type        = string
  description = " Configures whether metadata fields should be added to the reported VPC flow logs"
}

#Firewall creation:
variable "firewall" {
  type        = list(string)
  description = "Name of the firewall"
}

variable "source_ranges" {
  type        = list(string)
  description = "Traffic source range"
}

variable "protocol" {
  type        = string
  description = "Type of network protocol such as tcp/udp/icmp"
}

variable "ports" {
  type        = list(string)
  description = "Ports to be enabled"
}


variable "firewall_metadata" {
  type        = string
  description = "Metadata for the firewall logs "
}

variable "source_tags" {
  type        = list(string)
  description = "Source tags"
}

variable "target_tags" {
  type        = list(string)
  description = "Target tags"
}

# variable "target_service_accounts" {
#   type = string
#   description = "Target service accounts"
# }

#Cluster.........................................................................................
variable "cluster_name" {
  type        = string
  description = "name of the cluster"
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
  type        = bool
  description = "whether to enable vertical pod auoscaling"

}

# variable "cluster_secondary_range_name" {
#   type        = string
#   description = "The name of the existing secondary range in the cluster's subnetwork to use for pod IP addresses."

# }

# variable "services_secondary_range_name" {
#   type        = string
#   description = "The name of the existing secondary range in the cluster's subnetwork to use for cluster IP's"
# }

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

# variable "master_ipv4_cidr_block" {
#   type        = string
#   description = "The IP range in CIDR notation to use for the hosted master network."
# }

# variable "pubsub_notify" {
#   type        = bool
#   description = "Whether or not the notification config is enabled"

# }

# variable "cluster_topic" {
#   type        = string
#   description = "The pubsub topic to push upgrade notifications to. Must be in the same project as the cluster. Must be in the format: projects/{project}/topics/{topic}."

# }

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

#Node_Pool......................................................................
variable "node_pool" {
  type        = string
  description = "name of the node pool"

}

# variable "node_locations" {
#   type        = list(string)
#   description = "node location in accordance with cluster location"
# }

variable "initial_node_count" {
  type        = number
  description = "number of nodes to be created initially"

}

variable "min_node_count" {
  type        = number
  description = "min number of nodes to be maintained"

}

variable "max_node_count" {
  type        = number
  description = "max number of  nodes to be scaled"

}

variable "auto_repair" {
  type        = bool
  description = "Whether the nodes will be automatically repaired."

}

variable "auto_upgrade" {
  type        = bool
  description = "Whether the nodes will be automatically upgraded."

}

variable "node_machine_type" {
  type        = string
  description = "machine type of the nodes"

}
# variable "node_machine_type-1" {
#   type        = string
#   description = "machine type of the nodes"

# }

variable "node_image_type" {
  type        = string
  description = "image to be used for the nodes"

}
# variable "node_image_type-1" {
#   type        = string
#   description = "image to be used for the nodes"

# }
variable "preemptible" {
  type        = bool
  description = "A boolean that represents whether or not the underlying node VMs are preemptible."

}

variable "disk_size_gb" {
  type        = string
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB. Defaults to 100GB."

}

variable "disk_type" {
  type        = string
  description = "Type of the disk attached to each node (e.g. 'pd-standard', 'pd-balanced' or 'pd-ssd'). If unspecified, the default disk type is 'pd-standard'"

}

variable "service_account" {
  type        = string
  description = "asociated service account name"

}

variable "labels" {
  type        = map(string)
  description = "resource_lables"
  default     = {}

}

variable "enable_secure_boot" {
  type        = bool
  description = "Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. "

}

variable "enable_integrity_monitoring" {
  type        = bool
  description = "Enables monitoring and attestation of the boot integrity of the instance."

}

variable "upgrade_stratergy" {
  type        = string
  description = "Strategy used for node pool update. Strategy can only be one of BLUE_GREEN or SURGE. "

}


variable "max_surge" {
  type        = string
  description = "The maximum number of nodes that can be created beyond the current size of the node pool during the upgrade process."

}

variable "max_unavailable" {
  type        = string
  description = "The maximum number of nodes that can be simultaneously unavailable during the upgrade process."

}


#Pub Sub Topic......................................................................
# variable "pubsub_topic" {
#   type        = string
#   description = "name of the pubsub topic"

# }


