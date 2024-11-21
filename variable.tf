
variable "access_key" {
  type = string
  description = "AWS Access Key"

}

variable "secret_key" {
  type = string
  description = "AWS Secret Key"

}


# Location
# Region Ireland
variable "region" { 
    type = string
    default = "eu-west-1" 
}
# Default VPC - Ireland
variable "default_vpc_id" {
  type        = string
  description = "Default VPC ID"
  default     = "vpc-0035b5ae8bbbefd3f"
}
# Default Subnet - Ireland
variable "default_subnet_id" {
   type        = string
   description = "Default Subnet ID"
   default     = "subnet-02ae3d0545ef9967e"
 }

# default subnet 2 - Ireland
variable "default_subnet_id2" {
   type        = string
   description = "Default Subnet ID 2"
   default     = "subnet-0655f72c900baddc5"
 }

# default SG
variable "default_sg" {
  type = set(string)
  description = "value"
  default = ["sg-0c925a867a4bd98bf"]
  
}

# Instances
variable "name" {
  type        = string
  description = "Name of the instances"
  #default     = "Server"
  default     = "EVE"
}

variable "image" {
  type        = string
  description = "AMI ID used for the instances"
  # Ubuntu 20.04 LTS
  # https://cloud-images.ubuntu.com/locator/ec2/
  default = "ami-0f7158442d716c6b6"
}

variable "instance_type" {
    description = "The instance type to use for the instances"
    type        = string
    default     = "t2.micro"
}

variable "desired_capacity" {
    description = "The desired capacity of the Auto Scaling group"
    type        = number
    default     = 1
}

variable "max_size" {
    description = "The maximum size of the Auto Scaling group"
    type        = number
    default     = 3
}

variable "min_size" {
    description = "The minimum size of the Auto Scaling group"
    type        = number
    default     = 1
}


variable "EVETAG" {
    description = "The tag for the instances"
    type        = map(string)
    default     = {
        Owner = "EVE"
        Use = "TP-Terraform"

    }
  
}
