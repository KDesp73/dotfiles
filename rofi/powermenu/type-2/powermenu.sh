#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-5'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown='⏻'
reboot=''
lock='󰌾'
suspend='󰒲'
logout='󰍃'
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "${dir}/${theme}.rasi"
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			# Shutdown using runit-compatible command
			sudo shutdown -h now
		elif [[ $1 == '--reboot' ]]; then
			# Reboot using runit-compatible command
			sudo reboot
		elif [[ $1 == '--suspend' ]]; then
			# Suspend using elogind or equivalent
			mpc -q pause
			amixer set Master mute
			loginctl suspend
		elif [[ $1 == '--logout' ]]; then
			case "$DESKTOP_SESSION" in
				openbox) openbox --exit ;;
				bspwm) bspc quit ;;
				i3) i3-msg exit ;;
				plasma) qdbus org.kde.ksmserver /KSMServer logout 0 0 0 ;;
				xfce) killall xfce4-session ;;
				hyprland) killall Hyprland ;;
		esac
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "$shutdown")
		run_cmd --shutdown
        ;;
    "$reboot")
		run_cmd --reboot
        ;;
    "$lock")
        swaylock \
            --indicator-radius 100 \
            --indicator-thickness 7 \
            --ring-color 181926 \
            --text-color cad3ff \
            --key-hl-color a6da95 \
            --line-color 00000000 \
            --inside-color 00000088 \
            --separator-color 00000000 \
            --color 28282828
            ;;
    "$suspend")
        run_cmd --suspend
        ;;
    "$logout")
		run_cmd --logout
        ;;
esac
