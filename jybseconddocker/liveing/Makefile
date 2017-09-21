.PHONY: build run kill enter push pull

build:
	git clone https://github.com/visint/liveing
	sudo docker build --rm -t liveing:1.0 .

run:
	sudo docker run -d --restart=always  --name liveing -v /home/jiang:/mnt -p 9092:80 business:1.0
#	sudo docker run -d --name liveing -v /home/jiang:/mnt -p 9092:80 liveing:1.0

kill:
	sudo docker stop liveing 2 >/tmp/docker_tmp
	sudo docker rm liveing  2 >>/tmp/docker_tmp
	sudo docker rmi liveing:1.0


enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
