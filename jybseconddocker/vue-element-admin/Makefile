.PHONY: build run kill enter push pull

build:
	git clone https://github.com/PanJiaChen/vue-element-admin.git
#	sudo docker build -t vue:1.0 .

run: kill
	sudo docker run -d --name beego -p 8080:8080 beego:1.0

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
