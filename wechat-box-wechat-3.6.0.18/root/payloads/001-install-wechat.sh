#!/usr/bin/env bash
## https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes
function install() {
    echo "Start to install wechat..."
    while :
    do
        xdotool search '微信安装向导'
        NOTFOUND=$?
        if [ "$NOTFOUND" == "0" ]; then
            echo "Found wechat install wizard window, start to install wechat..."
            echo "Should take about a minute..."
            sleep 20
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key space
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Return
            sleep 16
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Return
            echo "Wechat install finished, break while loop"
            break
        fi
        sleep 3
    echo "Wechat install finished, should be ready"
    done
}

wine /WeChatSetup-v3.6.0.18.exe &
install
wait
sleep 15