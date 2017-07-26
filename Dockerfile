# Use an official Nvidia/CUDA image
FROM nvidia/cuda:8.0-cudnn5-runtime-ubuntu16.04

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install Python3
RUN apt-get -y update
RUN apt-get -y install python3 \
                       python3-dev \
                       python3-pip

# Install the app requeriments
RUN pip3 install -r requirements.txt
