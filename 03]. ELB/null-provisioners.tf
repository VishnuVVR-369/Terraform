# Create a Null Resource and Provisioners
resource "null_resource" "name" {
  depends_on = [module.ec2_public]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.public_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("private-key/global-key.pem")
  }

  ## File Provisioner: Copies the global-key.pem file to /tmp/global-key.pem
  provisioner "file" {
    source      = "private-key/global-key.pem"
    destination = "/tmp/global-key.pem"
  }
  ## Remote Exec Provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/global-key.pem"
    ]
  }
  ## Local Exec Provisioner
  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    on_failure  = continue
  }
}
