variable "aws_region" {
  type        = string
  default     = "ap-northeast-1"
  description = "AWS 도쿄 리전"
}

variable "ami_id" {
    type = string
    default = "ami-00d426f7bbc4670ed"
    description = "ap-northeast-1 리전의 ubuntu 24.04 LTS ami"
}

variable "key_name" {}
variable "public_key_path" {}
variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "EC2 free tier"
}
