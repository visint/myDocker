.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t ethereum:1.0 .

run:
	docker run -d --name ethereum-node -v /home/jiang/ethereum:/root \
           -p 8545:8545 -p 30303:30303 \
           ethereum/client-go --fast --cache=512

#	sudo docker run -d -it --restart=always  --name ethereum -v /home/jiang/ethereum:/data -p 9091:8000 ethereum:1.0

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
