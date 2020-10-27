variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

variable "public_key_path" {}
variable "private_key_path" {}

module "defaults" {
  source = "../.."

  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path

  domain_name = "insight-infra.de"
}
