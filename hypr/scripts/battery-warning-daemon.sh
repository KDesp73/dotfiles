#!/usr/bin/env bash


BAT=$(ls /sys/class/power_supply |grep BAT |head -n 1)

get_perc (){
    capacity="$(cat /sys/class/power_supply/${BAT}/capacity)"
    BATSTATUS="$(cat /sys/class/power_supply/${BAT}/status)"
}

warning (){
    get_perc
    if [ "$BATSTATUS" == "Discharging" ]; then
        # Send notification if <= 30%
        if [ "$capacity" -le 30 ]; then 
            notify-send "Battery Warning!" "Battery is at ${capacity}% discharging at a rate of $(cat /sys/class/power_supply/BAT0/power_now | awk '{ printf "%.1f\n", $1 / 1000000 }')W."
        fi
    fi
}

daemon() {
    while true; do
        warning
        sleep 300 # 5 minutes
    done
}

pid_path="$HOME/.local/state/battery-warning.pid"

start() {
    daemon &
    PID=$!
    echo "Starting daemon ($PID)..."
    echo $PID > $pid_path
}

stop() {
    PID=$(cat $pid_path)
    if [ $? -ne 0 ]; then
        echo "Daemon is not active"
        return
    fi
    echo "Stoping daemon ($PID)..."
    kill $PID
    if [ $? -ne 0 ]; then
        echo "Could not kill proccess $PID"
        return
    fi
    rm -rf $pid_path
}

restart() {
    stop
    start
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    *)
        echo "Usage battery-warning-daemon.sh {start|stop|restart}"
        exit 1
        ;;
esac
