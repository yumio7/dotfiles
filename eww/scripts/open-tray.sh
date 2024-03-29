#!/bin/bash
show_tray() {
    eww update tray=true
    swaymsg [class="stalonetray"] scratchpad show
    pidof tray-icon-fix || (tray-icon-fix &)
    sleep 0.2
    pkill tray-icon-fix
}

hide_tray() {
    eww update tray=false;
    swaymsg [class="stalonetray"] move scratchpad
}

if [[ $1 == false ]]; then
    show_tray
    swaymsg -t subscribe '["window"]' > /dev/null && hide_tray
else
    hide_tray
fi