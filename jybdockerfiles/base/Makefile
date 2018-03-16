.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t jyb-ubuntu:16.04 .

run: kill
	cmd=
	sudo docker run -it  -d --name ubuntu-test -v ${PWD}:/tmp jyb-ubuntu:16.04 /bin/bash

kill:
	-sudo docker kill ubuntu-test
	-sudo docker rm ubuntu-test

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
