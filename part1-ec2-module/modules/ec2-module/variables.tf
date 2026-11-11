variable "ami_id" {
  description = "The AMI ID to launch the EC2 instance with"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 8
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volume in GB"
  type        = number
  default     = 10
}

variable "ebs_volume_type" {
  description = "Type of the additional EBS volume (e.g., gp3, gp2)"
  type        = string
  default     = "gp3"
}

variable "mount_point" {
  description = "Directory path inside the OS where the EBS volume will be mounted"
  type        = string
  default     = "/mnt/data"
}

variable "instance_name" {
  description = "Tag Name for the EC2 instance and EBS volume"
  type        = string
  default     = "ec2-ebs-server"
}
