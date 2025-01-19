variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Dragongly Cluster"
  default     = "dragonfly"
}

variable "node_instance_type" {
  description = "Instance type for worker nodes"
  default     = "t3.medium"
}

variable "desired_nodes" {
  description = "Number of worker nodes"
  default     = 2
}
