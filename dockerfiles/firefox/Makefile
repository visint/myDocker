.PHONY: build run kill enter push pull

build:
	sudo docker build -t firefox:1.0 .

run: kill
#export GOPATH=/mnt/gocode
#export PATH=$GOPATH/bin:$PATH 
	sudo docker run -d --name firefox -v $(pwd):/mnt -p 7070:8080 -p 8888:5900 firefox:1.0

kill:
	-sudo docker kill beego
	-sudo docker rm beego

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
