
variable "environment" {
  default = "dev"
  }

variable "my_name" {
  default = "my-tf-jeeva"
}

variable "regions" {
  type=string
  default = "ap-south-1"
}

variable "instance_count" {
  description = "Number of ec2 instance"
  type=number  
}

variable "monitoring_enabled" {
  description = "Enabled detailed monitoring for EC2 instances"
  type = bool
  default = true
}

variable "associate_public_ip_address" {
  description = "associate ip addresss with EC2 address"
  type = bool
  default = true
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type = list(string)
  default = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12"]
}

variable "allowed_vm_types" {
  description = "List of allowed vm types"
  type = list(string)
  default = [ "t2.micro","t2.small","t3.micro","t3.small" ]
}

variable "allowed_region" {
  description = "regions"
  type = set(string)
  default = [ "us-east-1","us-west-2","ap-south-1" ]
}

variable "tags" {
  type=map(string)
  default = {
    Environment = "dev"
    Name = "dev-instance"
    created_by="terraform"
  }
}


variable "ingress_values" {
  type = tuple([ number , string,number])
  default = [ 443, "tcp", 443 ]
}

variable "config" {
  type = object({
    region = string,
    monitoring = bool,
    instance_count = number
  })
  default = {
    region = "ap-south-1",
    monitoring = true,
    instance_count = 1
  }
}

variable "bucket_name" {
  description = "List of s3 bucket names"
  type = list(string)
  default = [ "my-unique-bucket-day08-1","my-unique-bucket-day08-2","my-unique-bucket-day08-3" ]
}

variable "bucket_name_set" {
  description = "List of s3 bucket names"
  type = set(string)
  default = [ "my-unique-bucket-day08-11","my-unique-bucket-day08-22","my-unique-bucket-day08-33" ]
}

variable "resource_tags" {
  description = "Common tags applied to AWS resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "terraform-demo"
    Owner       = "jeeva"
  }
}


variable "availability_zones" {
  description = "List of Availability Zones for ASG"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "allowed_regions" {
  description = "List of allowed AWS regions for deployment"
  type        = list(string)
  default     = ["ap-south-1", "us-east-1"]
}


variable "ingress_rules" {
  description = "List of ingress rules for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS"
    }
  ]
}