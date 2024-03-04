#!/usr/bin/env bash
## https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes
function install() {
    sleep 30
    echo "Start to install wechat..."
    while :
    do
        echo "Searching for wechat install wizard window..."
        xdotool search '微信安装向导'
        NOTFOUND=$?
        if [ "$NOTFOUND" == "0" ]; then
            echo "Found wechat install wizard window, start to install wechat..."
            sleep 20
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key space
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Return
            sleep 30
            xdotool key Tab
            sleep 5
            xdotool key Tab
            sleep 5
            xdotool key Return
            echo "Wechat install finished, break while loop"
            break
        fi
        sleep 3
    done
    echo "Wechat install finished, should be ready"
}

wine /WeChatSetup-v3.6.0.18.exe &
install
wait
sleep 15