{
  "builders": [
    {
      "type": "docker",
      "image": "ubuntu:20.04",
      "commit": true
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "script": "scripts/setup.sh"
    }
  ]
}
