# Local Docker Swarm Testing

## System Requirements
* Vagrant
* Ansible

## Setup
Build the base Vagrant box `make build`

The make command really handles everything that needs to be done.

## Building a Swarm
Here is an example Vagrantfile that uses the new box to build out a 3 node swarm.

Each node has remote docker-engine enabled (insecure/non-tls). You can access a node directly via ssh (`vagrant ssh swarm01`) or via the remote docker-engine (`DOCKER_HOST=192.168.33.10 docker swarm node ls`)

This Vagrant box also has `vboxsf` installed. This will allow you to easily setup a shared directory with all nodes for storage. (e.g. `config.vm.synced_folder './data', '/src/docker'`)

**Note**: The swarm will have to be manually initiated and each node will need to be manually added.


```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "docker"
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define "swarm01" do |v|
    v.vm.hostname = "swarm01"
    v.vm.network "private_network", ip: "192.168.33.10"
  end

  config.vm.define "swarm02" do |v|
    v.vm.hostname = "swarm02"
    v.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.define "swarm03" do |v|
    v.vm.hostname = "swarm03"
    v.vm.network "private_network", ip: "192.168.33.12"
  end
end

```
