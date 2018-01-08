.PHONY: build run kill enter push pull

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
