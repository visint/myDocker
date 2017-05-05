FROM jyb-ubuntu-tool:16.04
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	apt-get update
RUN apt-get install -y golang


