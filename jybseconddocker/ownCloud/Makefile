.PHONY: build run kill enter push pull

build:

run:
	sudo docker run -d --restart=always  --name mkowncloud -v /Blinux/owncloud:/var/www/html/data -p 9095:80 owncloud
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
