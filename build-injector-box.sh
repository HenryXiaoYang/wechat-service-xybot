#!/usr/bin/env bash
mkdir docker_buiding || true
# update injector-box
if [ ! -d docker_buiding/injector-box ]; then
    cp -r injector-box/* docker_buiding/injector-box || echo "copy injector-box failed"
else
    echo "injector-box already exists"
fi

if [ ! -d docker_buiding/injector-box/target ]; then
    cp -r wechat-box-wechat-3.6.0.18/* docker_buiding/injector-box/target || echo "copy wechat-box-wechat-3.6.0.18 failed"
else
    echo "wechat-box-wechat-3.6.0.18 already exists"
fi

if [ ! -f docker_buiding/injector-box/target/root/WeChatSetup-v3.6.0.18.exe ]; then
  if [ ! -f WeChatSetup-v3.6.0.18.exe ]; then
    wget https://yangres.com/WeChatSetup-v3.6.0.18.exe
  fi
  cp WeChatSetup-v3.6.0.18.exe docker_buiding/injector-box/target/root
fi
cp bin_deps/auto.dll docker_buiding/injector-box/root/drive_c/injector
cd docker_buiding/injector-box
sudo docker build -t henryxiaoyang/wechat-service-xybot:latest .
cd -
