FROM nvidia/cuda:11.5.0-base-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y git make dpkg python3-opencv

COPY cudnn.deb cudnn.deb

RUN yes | dpkg -i cudnn.deb

RUN rm cudnn.deb

RUN git clone https://github.com/AlexeyAB/darknet.git

WORKDIR /darknet

RUN rm Makefile

COPY Makefile Makefile

RUN apt-get install -y g++ pkg-config

RUN apt-get install -y libopencv-dev

RUN make