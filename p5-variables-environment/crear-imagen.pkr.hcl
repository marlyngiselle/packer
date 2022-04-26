# Si se hace desde Windows solo hay que ejecutar los siguientes comandos
# para crear las variables de ambiente (environmental variables)
# 
# setx AWS_ACCESS_KEY_ID "el_id_de_tu_llave_en_aws"
# setx AWS_SECRET_ACCESS_KEY "el_secret_de_tu_llave_en_aws"
# setx AWS_DEFAULT_REGION "tu_region_preferida"

variable "nombre_imagen" {
  type = string
  default = "super-ami"
}

source "amazon-ebs" "ejemplo-basico" {
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