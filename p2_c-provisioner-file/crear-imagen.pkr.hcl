source "amazon-ebs" "ejemplo-basico" {
  region        =  "eu-west-3"
  source_ami    =  "ami-0c6ebbd55ab05f070"
  instance_type =  "t2.micro"
  ssh_username  =  "ubuntu"
  ami_name      =  "super-ami"
}

build {
  sources = ["source.amazon-ebs.ejemplo-basico"]

  provisioner "shell" {
    script = "comandos.sh"
  }
  provisioner "file" {
    source = "index.html"
    destination = "/tmp/"
  }
  provisioner "shell" {
    inline = ["sudo cp /tmp/index.html /var/www/html/"]
  }
}