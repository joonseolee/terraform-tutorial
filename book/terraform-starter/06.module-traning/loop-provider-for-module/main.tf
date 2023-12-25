locals {
  env = {
    dev = {
        type = "t3.micro"
        name = "dev_ec2"
    }
    prd = {
        type = "m5.large"
        name = "prd_ec2"
    }
  }
}

module "ec2_seoul" {
  for_each = local.env
  source = "../modules/terraform-aws-ec2"
  instance_type = each.value.type
  instance_name = each.value.name
}

output "module_output" {
  value = [
    for k in module.ec2_seoul: k.private_ip
  ]
}