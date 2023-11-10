
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.5.0"

  name = "${var.environment}-BastionHost"
  #instance_count         = 5
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_sg.security_group_id]
  tags                   = local.common_tags
}

module "ec2_private" {
  depends_on = [module.vpc] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "~> 5.5.0"

  count         = var.private_instance_count
  name          = "${var.environment}-vm"
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  #monitoring             = true
  subnet_id              = element(module.vpc.private_subnets, count.index)
  vpc_security_group_ids = [module.private_sg.security_group_id]
  # count         = var.private_instance_count
  user_data = file("${path.module}/install.sh")
  tags      = local.common_tags
}