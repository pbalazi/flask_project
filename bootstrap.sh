#!/usr/bin/env bash

# Fix locale issue
echo 'export LC_ALL="en_US.UTF-8"' >> /home/vagrant/.bashrc
sed -i '/AcceptEnv/s/^#*/#/'

# install python 3.6
apt update
apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y python3.6

# update alternatives
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
# update-alternatives --config python3

# install other dev tools
apt install -y git python-dev

# Install pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py

# install virtualenv
pip install virtualenv



