variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default = "us-east-1"
}
variable "region_2" {
  description = "The secondary AWS region to deploy resources in"
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "The availability zones to deploy resources in"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "availability_zones_2" {
  description = "The availability zones to deploy resources in for the secondary region"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "region_vpc" {
  description = "The name of the VPC to create in the primary region"
  type        = string
  default     = "primary-region-vpc"
  
}

variable "region_2_vpc" {
  description = "The name of the VPC to create in the secondary region"
  type        = string
  default     = "secondary-region-vpc"
}