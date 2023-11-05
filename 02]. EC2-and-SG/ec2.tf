
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name = "${var.environment}-BastionHost"
  #instance_count         = 5
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.this_security_group_id]
  tags                   = local.common_tags
}

module "ec2_private" {
  depends_on = [module.vpc] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "3.3.0"
  #for_each = toset([ module.vpc.private_subnets[0],module.vpc.private_subnets[1] ])
  for_each = toset(["0", "1"])
  # insert the 10 required variables here
  name          = "${var.environment}-vm-${each.key}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.this_security_group_id]

  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))
  #instance_count         = var.private_instance_count
  user_data = file("${path.module}/install.sh")
  tags      = local.common_tags
}