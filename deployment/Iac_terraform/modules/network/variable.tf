#VPC_Network
variable "vpc" {
  type        = list(string)
  description = "network resource"
}

variable "auto_create_subnetworks" {
  type = string
  description = "Boolean value whether to create subnets automatically or not"
}


#Subnets:
variable "subnets" {
  type        = list(string)
  description = "VPC subnetwork"
}

variable "subnet_regions" {
  type = list(string)
  description = "subnet deployment region"
}

variable "cidr_range" {
  type = list(string)
  description = "IP address range" 
}

variable "aggregation_interval" {
  type = string
  description = "Toggles the aggregation interval for collecting flow logs"
}

variable "flow_sampling" {
  type = string
  description = "Flow sampling for subnet logs"
}

variable "subnet_metadata" {
  type = string
  description = " Configures whether metadata fields should be added to the reported VPC flow logs"
}

#Firewall creation:
variable "firewall" {
  type = list(string)
  description = "Name of the firewall"
}

variable "source_ranges" {
  type = list(string)
  description = "Traffic source range" 
}

variable "protocol" {
  type = string
  description = "Type of network protocol such as tcp/udp/icmp"  
}

variable "ports" {
  type = list(string)
  description = "ports to be enabled"
}

variable "firewall_metadata" {
  type = string
  description = "Metadata for the firewall logs "
}

variable "source_tags" {
  type = list(string)
  description = "Source tags"
}

variable "target_tags" {
  type = list(string)
  description = "Target tags"
}
