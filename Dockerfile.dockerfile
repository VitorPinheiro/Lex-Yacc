FROM ubuntu:latest
RUN apt-get update -y \
  && apt-get install flex -y \
  && apt-get install bison -y
COPY files /tmp/files
VOLUME /tmp
WORKDIR /tmp