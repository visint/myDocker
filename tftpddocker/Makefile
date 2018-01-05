.PHONY: build run kill enter push pull

build:
	wget http://o6zvblq1c.bkt.clouddn.com/testServer
	chmod 777 testServer
	sudo docker build --rm -t sinzuotftp:1.0 .

run:
	sudo docker run -d --restart=always  --name tftp -v /home/jiang:/mnt -p 69:69/udp sinzuotftp:1.0
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
