variable "region" {
  description = "AWS region for VMs"
  default = "us-east-1"
}

variable "key_name" {
  default = "ansible_key"
}

variable "num_of_servers" {
  description = "numbers of Consul servers"
  default = 3
  
}


variable "instance_type"{
    description = "whice ec2 type to use"
    default = "t2.micro"

}

variable "ami" {
  description = "ami (ubuntu 18) to use - based on region"
  default = {
    "us-east-1" = "ami-00ddb0e5626798373"
    "us-east-2" = "ami-0dd9f0e7df0f0a138"
  }
}
