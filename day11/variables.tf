variable "project_name" {
  default = "Project alpha resource"
}

variable "default_tags" {
  default = {
    company="techcorp"
    managed_by ="hashicorp"
  }
}

variable "environment_tags" {
  default = {
    environment = "production"
    cost_center="cc-123"
  }
}

variable "buc_name" {
  default = " BUCKET-Project-alpha-resource!!" 
}

variable "allowed_ports" {
  default = "80,443,8080,3306"
}


variable "instance_sizes" {
  default = {
    dev="t2.micro"
    staging="t3.small"
    prod="t3.large"
  }
}

variable "environment" {
  default = "dev"
}