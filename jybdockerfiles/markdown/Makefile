.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t markdown:1.0 .

run:
	sudo docker run -d --restart=always  --name mark -v /home/bobo:/mnt -p 8080:80 -p 40000-40009:40000-40009 markdown:1.0

kill:
	-sudo docker kill ftpd_server
	-sudo docker rm ftpd_server

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
