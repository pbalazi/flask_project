#!/usr/bin/env bash

# Fix locale issue
locale_ok=$(cat /home/vagrant/.bashrc | grep "en_US.UTF-8" | wc -l)
ssh_enc_ok=$(cat /etc/ssh/sshd_config | egrep "#.*AcceptEnv" | wc -l)
if [[ $ssh_enc_ok -eq 0 ]]; then
    echo 'export LC_ALL="en_US.UTF-8"' >> /home/vagrant/.bashrc
fi
if [[ $locale_ok -eq 0 ]]; then
    sed -i '/AcceptEnv/s/^#*/#/'
fi

# install python 3.6
apt update && \
apt install software-properties-common && \
add-apt-repository ppa:deadsnakes/ppa && \
apt update && \
apt install -y python3.6 && \
apt install -y python3.5-gdbm 

# Stop if error
if [[ $? -ne 0 ]]; then
    echo "Error installation."
    exit 1
fi

# update alternatives
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
#update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 2

update-alternatives --config python3

# install other dev tools
apt install -y git python-dev

# Install pip
# Newer than xenial has distribution pip working
#wget https://bootstrap.pypa.io/get-pip.py && \
#python3 get-pip.py
apt install -y python3-pip

# install virtualenv
pip3 install virtualenv



