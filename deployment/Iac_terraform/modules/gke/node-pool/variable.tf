#Node_Pool.......................................................................................
variable "project_id" {
  type        = string
  description = "GCP Project Id"
}

variable "node_pool" {
  type        = string
  description = "name of the node pool"

}

variable "cluster" {
  type = string
  description = "Relevant cluster"
}

variable "location" {
    type = string
    description = "location of the cluster"
  
}

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

variable "node_image_type" {
  type        = string
  description = "image to be used for the nodes"

}

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

variable "target_tags" {
  type        = list(string)
  description = "network tags for firewall"

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

variable "create_timeout" {
  type        = string
  description = "create timeout value"

}

variable "update_timeout" {
  type        = string
  description = "update timeout value"

}




