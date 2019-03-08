FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y caca-utils
COPY 2CbrAEt /
CMD ["/usr/bin/cacaview", "/2CbrAEt"]
