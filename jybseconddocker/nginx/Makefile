.PHONY: build run kill enter push pull

#VPATH 设置  make run VPATH=PWD 或者  make run VPATH=/home/jiang


build:
	sudo docker build --rm -t jyb-nginx:1.0 .

run:
	docker run --name some-nginx -p9091:80  -v $(VPATH):/usr/share/nginx/html:ro -d daocloud.io/nginx
#	sudo docker run -d -it --restart=always  --name myantdesign -v /home/jiang:/mnt -p 9091:8000 jyb-antdesign:1.0 /bin/sh
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
