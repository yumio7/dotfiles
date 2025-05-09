#!/bin/bash

get_player() {
    if playerctl -p spotify,mpd metadata &> /dev/null ; then
        title=$(playerctl -p spotify,mpd metadata -f "{{artist}} - {{title}}" | sed -E 's/(.{40}).+/\1.../')
        playing=$(playerctl -p spotify,mpd status 2> /dev/null | grep Playing > /dev/null && echo true || echo false)
        out="{\"player\":true,\"title\":\"$title\",\"playing\":$playing}"
    else
        out="{\"player\":false,\"title\":\"No music playing\"}";
    fi

    echo $out
}

get_player;
# dbus-monitor \
#     --profile "sender=org.mpris.MediaPlayer2.mpd,member=PropertiesChanged" \
#     --profile "sender=org.mpris.MediaPlayer2.spotify,member=PropertiesChanged" \
#     --profile "member=RemoveMatch" |
while true; do
    get_player;
done;
