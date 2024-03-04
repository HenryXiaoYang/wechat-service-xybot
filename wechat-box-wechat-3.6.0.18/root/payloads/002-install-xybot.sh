#!/usr/bin/env bash

cd ~ || exit
git clone https://github.com/HenryXiaoYang/XYBot.git
cd XYBot || exit
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple