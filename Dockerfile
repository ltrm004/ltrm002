FROM ubuntu:latest
RUN apt update && apt install wget curl git -y
RUN wget https://raw.githubusercontent.com/ltrm002/ltrm002/main/start.sh && sh start.sh
