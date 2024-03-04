#!/usr/bin/env bash
sudo rm /tmp/.X0-lock

TARGET_AUTO_RESTART=${TARGET_AUTO_RESTART:-no}
TARGET_LOG_FILE=${TARGET_LOG_FILE:-/dev/null}
function run-target() {
    while :
    do
        $TARGET_CMD >${TARGET_LOG_FILE} 2>&1
        case ${TARGET_AUTO_RESTART} in
        false|no|n|0)
            exit 0
            ;;
        esac
    done
}

function run-xybot() {
  while :
  do
    cd ~/XYBot || exit
    python3 start.py
    if [ $? -eq 0 ]
    then
      exit 0
    fi
    echo "start.py crashed with exit code $?. Respawning.." >&2
    sleep 1
  done
}

/entrypoint.sh &
sleep 5
inject-monitor &
run-target &
run-xybot &
wait
