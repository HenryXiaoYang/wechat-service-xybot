# wechat-service-xybot

## How To Use 如何使用

### 1. Pull and Run the docker image 拉取并运行docker镜像
```shell
# Step 1: pull
sodu docker pull henryxiaoyang/wechat-service-xybot:latest

# Step 2: run
sudo docker run -it --name wechat-service-xybot  \
    -e HOOK_PROC_NAME=WeChat \
    -e HOOK_DLL=auto.dll \
    -e TARGET_AUTO_RESTART="yes" \
    -e INJ_CONDITION="[ \"\`sudo netstat -tunlp | grep 5555\`\" != '' ] && exit 0 ; sleep 5 ; curl 'http://127.0.0.1:8680/hi' 2>/dev/null | grep -P 'code.:0'" \
    -e TARGET_CMD=wechat-start \
    -p 4000:8080 -p 5555:5555 -p 5900:5900 \
    --add-host=dldir1.qq.com:127.0.0.1 \
    henryxiaoyang/wechat-service-xybot:latest
```

### 2. Open VNC in your browser `http://<your ip address>:4000/vnc.html` 在浏览器中打开VNC `http://<你的ip地址>:4000/vnc.html`

### 3. Scan the WeChat QRCode to login 扫描微信二维码登录

### 4. Enjoy it! 享受吧！

## How to manage 如何管理

### 1. Enter the terminal of container 进入容器的终端
```shell
sudo docker exec -it wechat-service-xybot /bin/bash
```

### 2. Change directory to the XYBot directory 切换到XYBot目录
```shell
cd /home/app/XYBot
```

### 3. Edit the settings file 编辑配置文件
```shell
vim main_config.yml
vim plugins/gpt.yml
```

### 4. Find Other setting file 查找其他配置文件
```shell
find . -type d -name .git -prune -o -type f -name "*.yml" -print
```

### 5. Restart or reload XYBot plugins to enable the new settings 重启或重新加载XYBot插件以启用新的设置

#### First method(Recommended for initial setup 第一个方法(首次设置时推荐):
Restart the docker container and re-login into WeChat 重启docker容器并重新登陆微信

#### Second method(Recommended) 第二个方法(推荐):
Use XYBot command via WeChat to reload the plugins 使用微信发送XYBot命令重新加载插件
