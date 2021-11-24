variable "name" {
  description = "Name for this resource"
  default     = "network-toolkit"
}

variable "ami" {
  description = "Amazon Machine Image (AMI) Variables"
  type = object({
    arn: string
  })
  default = {
    arn = ""
  }
}

variable "tags" {
  description = "Common tags for these resources"
  type = map(string)
  default = {
    Service: "network-toolkit"
    ManagedBy: "Terraform"
  }
}