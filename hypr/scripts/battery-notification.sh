#!/usr/bin/env bash

BAT=$(ls /sys/class/power_supply |grep BAT |head -n 1)

get_perc (){
    capacity="$(cat /sys/class/power_supply/${BAT}/capacity)"
    BATSTATUS="$(cat /sys/class/power_supply/${BAT}/status)"
}

main (){
    get_perc
    if [ "$BATSTATUS" == "Discharging" ]; then
        if [ "$capacity" -le 30 ]; then
            notify-send "Battery Warning!" "Battery is at ${capacity}% discharging at a rate of $(cat /sys/class/power_supply/BAT0/power_now | awk '{ printf "%.1f\n", $1 / 1000000 }')W."
        else
            echo "Battery is at ${capacity}%"
            echo "Using $(cat /sys/class/power_supply/BAT0/power_now | awk '{ printf "%.1f\n", $1 / 1000000 }')W"
        fi
    fi
}

main
