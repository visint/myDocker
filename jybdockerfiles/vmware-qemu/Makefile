.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t qemu:1.0 .

run: kill
	sudo docker run -it  -d --name qemu-test -v ${PWD}:/tmp qemu:1.0 /bin/bash

kill:
	-sudo docker kill qemu-test
	-sudo docker rm qemu-test

enter:
	sudo docker exec -it qemu-test sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
