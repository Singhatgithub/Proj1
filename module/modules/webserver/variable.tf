variable "instance_type" {
    type = string
}

variable "image_id" {
    type = string
}

variable "key" {
    type = string
}

variable "key_name" {
    type = string
}

variable "subnet_id" {
}

variable "security_group_id" {
  description = "Security group ID to attach to the instance"
  type        = string
}
