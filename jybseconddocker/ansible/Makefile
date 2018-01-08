.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t ansible:1.0 .

run:
	sudo docker run -it -d --restart=always  --name ansible -v /home/jiang:/mnt -p 9098:80 ansible:1.0 /bin/bash
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

kill:
	-sudo docker kill ansible
	-sudo docker rm ansible

enter:
	sudo docker exec -it ansible sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
