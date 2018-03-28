.PHONY: build run kill enter push pull

#VPATH 设置  make run 默认映射当前目录 或者  make run VPATH=/home/jiang

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif


build:
	sudo docker build --rm -t jyb-nginx:1.0 .

run:
	docker run --name some-nginx -p9091:80  -v $(VPATH):/usr/share/nginx/html:ro -d daocloud.io/nginx
#	sudo docker run -d -it --restart=always  --name myantdesign -v /home/jiang:/mnt -p 9091:8000 jyb-antdesign:1.0 /bin/sh
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

kill:
	-sudo docker kill some-nginx
	-sudo docker rm some-nginx

enter:
	sudo docker exec -it some-nginx sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
