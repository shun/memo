#!/bin/bash
set -eu

apt update
apt upgrade -y
apt install -y software-properties-common htop curl python python3 python-pip python3-pip python-dev python3-dev git
curl -sSL https://get.docker.com | bash

pip install docker-compose

add-apt-repository ppa:graphics-drivers/ppa
apt update
apt install -y nvidia-driver-410
curl -sSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb | dpkg -i 
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
apt-get update
apt-get install cuda
