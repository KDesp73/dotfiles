#!/usr/bin/env bash

LOCK="󰌾  Lock"
SUSPEND="󰤄  Suspend"
LOGOUT="󰍃  Log out"
REBOOT="  Reboot"
REBOOT_UEFI="  Reboot to UEFI"
SHUTDOWN="󰐥  Shutdown"

SELECTION="$(printf "%s\n%s\n%s\n%s\n%s\n%s" "$LOCK" "$SUSPEND" "$LOGOUT" "$REBOOT" "$REBOOT_UEFI" "$SHUTDOWN" | fuzzel --dmenu -a top-right -l 6 -w 18 -p "Select an option: ")"

confirm_action() {
    local action="$1"
    CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu -a top-right -l 2 -w 18 -p "$action?")"
    [[ "$CONFIRMATION" == *"Yes"* ]]
}

case $SELECTION in
    *"$LOCK"*)
        swaylock \
            --screenshots \
            --clock \
            --indicator \
            --indicator-radius 100 \
            --indicator-thickness 7 \
            --effect-blur 7x5 \
            --effect-vignette 0.5:0.5 \
            --ring-color 181926 \
            --text-color cad3ff \
            --key-hl-color a6da95 \
            --line-color 00000000 \
            --inside-color 00000088 \
            --separator-color 00000000 \
            --fade-in 0.2
        ;;
    *"$SUSPEND"*)
        if confirm_action "Suspend"; then
            systemctl suspend
        fi;;
    *"$LOGOUT"*)
        if confirm_action "Log out"; then
            swaymsg exit
        fi;;
    *"$REBOOT"*)
        if confirm_action "Reboot"; then
            systemctl reboot
        fi;;
    *"$REBOOT_UEFI"*)
        if confirm_action "Reboot to UEFI"; then
            systemctl reboot --firmware-setup
        fi;;
    *"$SHUTDOWN"*)
        if confirm_action "Shutdown"; then
            systemctl poweroff
        fi;;
    *)
        echo "No match"
        ;;
esac

