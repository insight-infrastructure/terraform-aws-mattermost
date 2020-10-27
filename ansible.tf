

#########
# Ansible
#########
variable "ansible_hardening" {
  description = "Run hardening roles"
  type        = bool
  default     = false
}

variable "playbook_vars" {
  description = "Additional playbook vars"
  type        = map(string)
  default     = {}
}

variable "keystore_path" {
  description = "The path to the keystore"
  type        = string
  default     = ""
}

variable "keystore_password" {
  description = "The password to the keystore"
  type        = string
  default     = ""
}

variable "operator_keystore_password" {
  description = "the path to your keystore"
  type        = string
  default     = ""
}

variable "operator_keystore_path" {
  description = "The keystore password"
  type        = string
  default     = ""
}

variable "associate_eip" {
  description = "Boolean to determine if you should associate the ip when the instance has been configured"
  type        = bool
  default     = false
}

// TODO
variable "switch_ip_internally" {
  description = "Bool to switch ip internally"
  type        = bool
  default     = false
}

variable "endpoint_url" {
  description = "API endpoint to sync off of - can be citizen node or leave blank for solidwallet.io"
  type        = string
  default     = ""
}

variable "public_ip" {
  description = "The public IP of the elastic ip to attach to active instance"
  type        = string
  default     = ""
}

variable "bastion_user" {
  description = "Optional bastion user - blank for no bastion"
  type        = string
  default     = ""
}

variable "bastion_ip" {
  description = "Optional IP for bastion - blank for no bastion"
  type        = string
  default     = ""
}


variable "vars_file" {
  description = "Path to vars file"
  type        = string
  default     = "vars.yaml.example"
}

module "ansible" {
  source           = "github.com/insight-infrastructure/terraform-aws-ansible-playbook.git?ref=v0.14.0"
  create           = var.create
  ip               = join("", aws_eip_association.this.*.public_ip)
  user             = "ubuntu"
  private_key_path = pathexpand(var.private_key_path)

  //  bastion_ip   = var.bastion_ip
  //  bastion_user = var.bastion_user

  playbook_file_path = "${path.module}/ansible/main.yml"
  playbook_vars      = merge(yamldecode(file("${path.module}/${var.vars_file}")), { ansible_fqdn = aws_route53_record.this.fqdn }, var.playbook_vars)

  //  requirements_file_path = "${path.module}/ansible/requirements.yml"
}
