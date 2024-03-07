#!/usr/bin/env bash

# Clone XYBot from GitHub
if [ ! -d XYBot ]; then
  git clone https://github.com/HenryXiaoYang/XYBot.git XYBot
fi

sudo docker build -t henryxiaoyang/wechat-service-xybot:v0.0.5 .

