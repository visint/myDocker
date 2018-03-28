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
	sudo docker build --rm -t tensorflow:1.0 .

run:
	docker run -it -d --name mytensorflow -v /home/jiang/notebooks:/notebooks -p 9098:8888 daocloud.io/daocloud/tensorflow:latest
#	sudo docker run -d  --name mytensorflow -v /home/jiang/notebooks:/notebooks -p 9099:8888 tensorflow:1.0
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

kill:
	-sudo docker kill mytensorflow
	-sudo docker rm mytensorflow

enter:
	sudo docker exec -it mytensorflow sh -c "export TERM=xterm && jupyter notebook list"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
