FROM daocloud.io/daocloud/tensorflow:latest
RUN rm -f /run_jupyter.sh
COPY run_jupyter.sh /run_jupyter.sh
ENTRYPOINT ["/run_jupyter.sh"]
