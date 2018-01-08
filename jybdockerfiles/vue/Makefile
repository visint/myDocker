.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t jyb-vue:1.1 .

run: kill
	sudo docker run -d --name vue -p 21:21 -p 30000-30009:30000-30009 -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" jyb-vue:1.1

kill:
	sudo docker kill vue
	sudo docker rm vue

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
