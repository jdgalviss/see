# Use an official Python runtime as a parent image
FROM tensorflow/tensorflow:1.4.1-gpu-py3

# install opencv for python 3
RUN apt-get update && \
  apt-get install -y \
  libglib2.0-0 \
  libsm6 \
  libxext6 \
  libxrender-dev \
  build-essential \
  git \
  libasound2-dev \
  libavformat-dev \
  libcanberra-gtk3-module \
  libgtk-3-dev \
  libjasper-dev \
  libjpeg-dev \
  libpng-dev \
  libpq-dev \
  libswscale-dev \
  libtbb-dev \
  libtbb2 \
  libtiff-dev \
  pkg-config \
  python3 \
  python3-pip \
  unzip \
  wget \
  yasm \
  libnccl2 \
  libnccl-dev \
  && apt-get -y clean all \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install -v --trusted-host pypi.python.org -r requirements.txt

# Copy the current directory contents into the container at /app
COPY chainer /usr/src/app/chainer
COPY datasets /usr/src/app/datasets
COPY utils /usr/src/app/utils
COPY *.ipynb /usr/src/app/
#COPY *.py /usr/src/app/

WORKDIR /usr/src/app/

# Define environment variable
ENV NAME See
