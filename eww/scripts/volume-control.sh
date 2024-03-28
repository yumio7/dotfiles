# pacontrol.sh
#
# This script changes the volume of the current audio source based on a set interval

vol_interval=5
latest_sink=$(pactl get-default-sink)

case $1 in
    "up")
        pactl set-sink-mute $latest_sink 0
        pactl set-sink-volume $latest_sink +$vol_interval%
        ;;
    "down")
        pactl set-sink-volume $latest_sink -$vol_interval%
        ;;
    "toggle-mute") 
        pactl set-sink-mute $latest_sink toggle
        ;;
    *) usage ;;
esac