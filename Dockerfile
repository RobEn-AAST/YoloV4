FROM nvidia/cuda:11.6.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y git make dpkg libopencv-dev g++ pkg-config python3-pip

RUN git clone https://github.com/RobEn-AAST/darknet.git

WORKDIR /darknet

RUN rm Makefile

RUN pip3 install opencv-python

COPY Makefile Makefile

RUN make