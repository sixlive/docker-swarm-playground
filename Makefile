build:
	vagrant up
	vagrant halt
	vagrant package --output docker.box
	vagrant destroy -f
	rm -rf .vagrant
	vagrant box add -f docker docker.box
	rm *.retry
	rm docker.box

clean:
	vagrant destroy -f
	rm -rf .vagrant
	rm *.retry
	rm docker.box

default: build
