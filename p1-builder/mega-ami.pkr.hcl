source "amazon-ebs" "ejemplo-basico" {

  region        =  "eu-west-3"
  source_ami    =  "ami-0c6ebbd55ab05f070"
  instance_type =  "t2.micro"
  ssh_username  =  "ubuntu"
  ami_name      =  "mi-mega-ami"
}

build {
  sources = ["source.amazon-ebs.ejemplo-basico"]
}

