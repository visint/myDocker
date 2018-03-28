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
	sudo docker build --rm -t sinzuo-ftp:1.0 .

run: kill
	docker run -it  -d --name sinzuo-ftp -p 20:20 21:21 -v $(VPATH):/tmp sinzuo-ftp:1.0 

kill:
	-sudo docker kill sinzuo-ftp
	-sudo docker rm sinzuo-ftp

enter:
	sudo docker exec -it sinzuo-ftp sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
