variables = {
  "required_plugins" : {
    "docker" : {
      "version" : ">= 1.0.0"
    },
    "ansible" : {
      "version" : ">= 2.0.0"
    }
  },
docker = {
  "version" = ">= 1.0.0"
  "source"  = "github.com/hashicorp/docker"
}
ansible = {
  "version" = ">= 1.0.0"
  "source"  = "github.com/hashicorp/ansible"
}

"variables" : {
"dockerhub_username" : "adriananogueira",
"dockerhub_password" : "dckr_pat_6FsdxnU6Yye5FkiryB8JrL3hftg"
},
"required_plugins" : {
"docker" : {
"version" : ">= 1.0.0"
},
"ansible" : {
"version" : ">= 2.0.0"
}
},
"builders" : [
{
"type" : "docker",
"image" : "ubuntu:20.04",
"commit" : true,
"author" : "adriana.nogueira@ilegra.com",
"changes" : [
"EXPOSE 8090",
"CMD [\"apache-tomcat-10.0.12/bin/catalina.sh\", \"run\"]"
]
}
],
"provisioners" : [
{
"type" : "shell",
"inline" : [
"apt-get update",
"apt-get install ansible -y"
]
},
{
"type" : "ansible",
"playbook_file" : "job-02/playbook.yml",
"extra_arguments" : ["-i", "inventory.ini"]
},
{
"type" : "file",
"source" : "{{user `tomcat_dir`}}",
"destination" : "/home/ubuntu/apache-tomcat-10.0.12.tar.gz"
}
],
"post-processors" : [
{
"type" : "docker-tag",
"repository" : "adriananogueira/tema_01_final",
"tags" : ["1.0", "latest"]
},
{
"type" : "docker-push",
"login" : true,
"login_username" : "{{user `dockerhub_username`}}",
"login_password" : "{{user `dockerhub_password`}}"
}
],
"packer" : {
"ignore_files" : [
".gitignore",
".git"
]
}
}