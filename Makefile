build:
	vagrant up
	vagrant halt
	vagrant package --output docker.box
	vagrant destroy -f
	rm -rf .vagrant/
	vagrant box add -f docker docker.box
	rm docker.box

clean:
	vagrant box remove docker
	rm -rf .vagrant/
	rm docker.box

default: build
