# FROM defines the base image
FROM gcr.io/tensorflow/tensorflow:latest-gpu
MAINTAINER Jihong Ju <daniel.jihong.ju@gmail.com>

# Disable interactive interface
ARG DEBIAN_FRONTEND=noninteractive

# RUN executes a shell command
# You can chain multiple commands together with &&
# A \ is used to split long lines to help with readability
RUN apt-get update && apt-get install -y \
    # tools
    git \
    vim \
    python-setuptools \
    python-virtualenv \
    graphviz

ADD requirements.txt

RUN pip install -r requirements.txt

# Set keras backend to tensorflow by default
ENV KERAS_BACKEND tensorflow

