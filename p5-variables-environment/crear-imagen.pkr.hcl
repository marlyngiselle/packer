variable "nombre_imagen" {
  type = string
  default = "super-ami"
}

source "amazon-ebs" "ejemplo-basico" {
  region        =  "eu-west-3"
  source_ami    =  "ami-0c6ebbd55ab05f070"
  instance_type =  "t2.micro"
  ssh_username  =  "ubuntu"
  ami_name      =  var.nombre_imagen
}

build {
  sources = ["source.amazon-ebs.ejemplo-basico"]

  provisioner "shell" {
    inline = [ "sleep 30", "sudo apt update", "sudo apt install -y nginx" ]
  }

}