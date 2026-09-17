# VPC Resource

resource "aws_vpc" "std20_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    instance_tenancy       = "default"

    tags = {
        Name = "std20-ex7-state-vpc"
    }
}

