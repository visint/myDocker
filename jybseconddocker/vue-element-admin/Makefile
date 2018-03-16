.PHONY: build run kill enter push pull

build:
	git clone https://github.com/PanJiaChen/vue-element-admin.git
#	sudo docker build -t vue:1.0 .

run: 
	docker run -d --name vue1 -p 21:21 -p 9527:9527 -v "$PWD":/mnt -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" jyb-vue:1.1

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
