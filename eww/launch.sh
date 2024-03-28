#!/bin/bash
killall -9 eww;
barsfile="$HOME/.config/eww/yuck/bars.yuck";

pidof stalonetray || (stalonetray &) && swaymsg [class="stalonetray"] move scratchpad;
echo "" > "$barsfile";
count=0;
toeval="";
for monitor in $(xrandr | awk '/ connected/{print $1}'); do
    cat >> "$barsfile" << EOL
(defwindow bar$count
  :monitor "$count"
  :windowtype "dock"
  :exclusive true
  :geometry 
    (geometry
      :y "0"
      :width "100%"
      :height "45px"
      :anchor "top center")
  (bar :monitor "$count"))

EOL
    toeval="$toeval eww open bar$count &"
    count=$((count + 1));
done

eww daemon &
eval $toeval