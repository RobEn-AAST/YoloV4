FROM nvidia/cuda:11.5.0-base-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y git make dbkg python3-opencv

RUN wget -O cuddan.deb http://www.mediafire.com/file/lxuvgld7yic0ox7/cudnn.deb

RUN yes | dpkg -i cuddan.deb

RUN rm cuddan.deb

RUN git clone https://github.com/AlexeyAB/darknet.git

WORKDIR /darknet

RUN rm Makefile

COPY Makefile Makefile

RUN make