.PHONY: build run kill enter push pull

build:
	git clone https://github.com/visint/markdown
	sudo docker build --rm -t business:1.0 .

run:
	sudo docker run -d --restart=always  --name business -v /home/bobo:/mnt -p 9091:80 business:1.0
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

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
