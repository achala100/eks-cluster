variable "cluster-name" {
    default = "production_cluster"
    type = string
}

data "aws_availability_zones" "available" {
  state = "available"
}

