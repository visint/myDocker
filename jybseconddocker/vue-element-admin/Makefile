.PHONY: build run kill enter push pull
#MAINTAINER jiang_yi_bo <admin@sinzuo.com>
#VPATH 设置 make run 默认映射当前目录 或者 make run VPATH=/home/jiang
#   sudo docker run -d -it --restart=always --name myantdesign -v /home/jiang:/mnt -p 9091:8000 jyb-antdesign:1.0 /bin/sh
#   sudo docker run -d --name business -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" -v /home/jiang:/mnt -p 9091:80 business:1.0

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif


build:
	git clone https://github.com/PanJiaChen/vue-element-admin.git
#	sudo docker build -t vue:1.0 .

run: 
	docker run -d --name vue1 -p 21:21 -p 9527:9527 -v $(VPATH):/mnt -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" jyb-vue:1.1

kill:
	-sudo docker kill vue1
	-sudo docker rm vue1

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
