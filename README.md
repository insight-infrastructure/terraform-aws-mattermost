# terraform-aws-mattermost

[![open-issues](https://img.shields.io/github/issues-raw/insight-infrastructure/terraform-aws-mattermost?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-mattermost/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-infrastructure/terraform-aws-mattermost?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-mattermost/pulls)

## Features

This module sets up a mattermost server on AWS with SSL. Be sure to change the `vars.yaml.example` with own secure
 passwords and change reference per example 

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl
variable "public_key_path" {}
variable "private_key_path" {}

module "defaults" {
  source = "../.."

  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path

  domain_name = "insight-infra.de"  # Use your domain / subdomain 
  
  vars_file = 

}
```
## Examples

- [defaults](https://github.com/insight-infrastructure/terraform-aws-mattermost/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| additional\_security\_group\_ids | List of security groups | `list(string)` | `[]` | no |
| ansible\_hardening | Run hardening roles | `bool` | `false` | no |
| associate\_eip | Boolean to determine if you should associate the ip when the instance has been configured | `bool` | `false` | no |
| bastion\_ip | Optional IP for bastion - blank for no bastion | `string` | `""` | no |
| bastion\_user | Optional bastion user - blank for no bastion | `string` | `""` | no |
| create | Boolean to create resources or not | `bool` | `true` | no |
| create\_sg | Bool for create security group | `bool` | `true` | no |
| domain\_name | n/a | `string` | n/a | yes |
| endpoint\_url | API endpoint to sync off of - can be citizen node or leave blank for solidwallet.io | `string` | `""` | no |
| instance\_type | Instance type | `string` | `"t3a.small"` | no |
| key\_name | The key pair to import - leave blank to generate new keypair from pub/priv ssh key path | `string` | `""` | no |
| keystore\_password | The password to the keystore | `string` | `""` | no |
| keystore\_path | The path to the keystore | `string` | `""` | no |
| monitoring | Boolean for cloudwatch | `bool` | `false` | no |
| name | The name for the label | `string` | `"mattermost"` | no |
| operator\_keystore\_password | the path to your keystore | `string` | `""` | no |
| operator\_keystore\_path | The keystore password | `string` | `""` | no |
| playbook\_vars | Additional playbook vars | `map(string)` | `{}` | no |
| private\_key\_path | The path to the private ssh key | `string` | n/a | yes |
| private\_port\_cidrs | List of CIDR blocks for private ports | `list(string)` | <pre>[<br>  "172.31.0.0/16"<br>]</pre> | no |
| private\_ports | List of publicly open ports | `list(number)` | `[]` | no |
| public\_ip | The public IP of the elastic ip to attach to active instance | `string` | `""` | no |
| public\_key\_path | The path to the public ssh key | `string` | n/a | yes |
| public\_ports | List of publicly open ports | `list(number)` | <pre>[<br>  22,<br>  80,<br>  443<br>]</pre> | no |
| root\_iops | n/a | `string` | n/a | yes |
| root\_volume\_size | Root volume size | `number` | `8` | no |
| root\_volume\_type | n/a | `string` | `"gp2"` | no |
| subnet\_id | The id of the subnet | `string` | `""` | no |
| switch\_ip\_internally | Bool to switch ip internally | `bool` | `false` | no |
| tags | Map of tags | `map(string)` | `{}` | no |
| vars\_file | Path to vars file | `string` | `""` | no |
| vpc\_id | Custom vpc id - leave blank for deault | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| public\_ip | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [insight-infrastructure](https://github.com/insight-infrastructure)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.