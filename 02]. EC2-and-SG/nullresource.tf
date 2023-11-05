# Create a Null Resource and Provisioners

resource "null_resource" "name" {
    # depends_on = [module.ec2_public]
    connection {
      type     = "ssh"
      host     = aws_eip.bastion_eip.public_ip    
      user     = "ubuntu"
      password = ""
      private_key = file("private-key/global-key.pem")
    }  

    provisioner "file" {
      source      = "private-key/global-key.pem"
      destination = "/tmp/global-key.pem"
    }
    provisioner "remote-exec" {
      inline = [
        "sudo chmod 400 /tmp/global-key.pem"
      ]
    }
    provisioner "local-exec" {
      command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
      working_dir = "local-exec-output-files/"
      on_failure = continue
    }
}