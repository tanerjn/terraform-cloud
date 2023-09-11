# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 Instance Type - Instance Sizing"
  type = string
  default = "t2.micro"
  #default = "t2.small"
}


variable "tfc_aws_dynamic_credentials" {
  description = "Object containing AWS dynamic credentials configuration"
  type = object({
    default = object({
      shared_config_file = "~/.aws/credentials"
    })
    aliases = map(object({
      shared_config_file = string
    }))
  })
}
