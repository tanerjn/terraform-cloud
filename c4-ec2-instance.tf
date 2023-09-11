# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.vpc-dev-public-subnet-1.id
  security_groups = [
        aws_security_group.vpc-ssh.id,
        aws_security_group.vpc-web.id
  ]

  key_name      = "terraform_user"
  
  #count = terraform.workspace == "default" ? 1 : 1    
	user_data = file("apache-install.sh")  
  tags = {
    "Name" = "vm-${terraform.workspace}-0"
  }

  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform_user.pem")
  }  

 # Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
  }

# Copies the file to Apache Webserver /var/www/html directory
  provisioner "remote-exec" {
    inline = [
      "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/file-copy.html /var/www/html"
    ]
  }

}







