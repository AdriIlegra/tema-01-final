# job-02/packer.pkr.hcl
source "docker" "ubuntu" {
  image   = "ubuntu:20.04"
  commit  = true
  author  = "adriana.nogueira@ilegra.com"

  changes = [
    "EXPOSE 8090",
    "CMD [\"apache-tomcat-10.0.12/bin/catalina.sh\", \"run\"]"
  ]
}

build {
  sources = ["source.docker.ubuntu"]
  builders = ["docker"]
}

provisioner "shell" {
  inline = [
    "apt-get update",
    "apt-get install ansible -y"
  ]
}

provisioner "ansible" {
  playbook_file    = "job-02/playbook.yml"
  extra_arguments  = ["-i", "inventory.ini"]
}

provisioner "file" {
  source      = "{{user `tomcat_dir`}}"
  destination = "/home/ubuntu/apache-tomcat-10.0.12.tar.gz"
}

post-processor "docker-tag" {
  repository = "adriananogueira/tema_01_final"
  tags       = ["1.0", "latest"]
}

post-processor "docker-push" {
  login            = true
  login_username   = var.DOCKERHUB_USERNAME
  login_password   = var.DOCKERHUB_PASSWORD
}
