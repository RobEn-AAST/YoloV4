FROM nvidia/cuda:11.5.0-base-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y git make dpkg python3-opencv

RUN apt-get install wget

RUN wget http://www.mediafire.com/file/lxuvgld7yic0ox7/cudnn.deb

RUN yes | dpkg -i cudnn.deb

RUN rm cuddan.deb

RUN git clone https://github.com/AlexeyAB/darknet.git

WORKDIR /darknet

RUN rm Makefile

COPY Makefile Makefile

RUN make