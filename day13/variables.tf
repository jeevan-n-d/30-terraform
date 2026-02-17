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

variable "instance_type" {
  default = "t2.micro"

validation {
  condition = length(var.instance_type) >= 2 && length(var.instance_type) <=20
  error_message = "instance tyoe must be betweeen 2 and 20"
}

validation {
  condition = can(regex("^t[2-3]\\.",var.instance_type))
  error_message = "please use t2 ot t3"
}

}

variable "backup_name" {
  default = "daily_backup"
  validation {
    condition = endswith(var.backup_name,"_backup")
    error_message = "Backup name must end with _backup"
  }
}

variable "credentials" {
  default = "qwerty"
  sensitive = false
}

variable "default_locations" {
  default = ["ap-south-1"]
}

variable "user_locations" {
  default = ["ap-south-1","us-west-1"]
}

variable "monthly_costs" {
  default = [-50,100,75,200]
}

