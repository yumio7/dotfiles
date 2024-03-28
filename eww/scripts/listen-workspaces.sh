#!/bin/sh
workspaces() {

ws1="1"
ws2="2"
ws3="3"
ws4="4"
ws5="5"
ws6="6"

# Unoccupied
un="0"

# check if Occupied
o1=$(bspc query -D -d .occupied --names | grep "$ws1" )
o2=$(bspc query -D -d .occupied --names | grep "$ws2" )
o3=$(bspc query -D -d .occupied --names | grep "$ws3" )
o4=$(bspc query -D -d .occupied --names | grep "$ws4" )
o5=$(bspc query -D -d .occupied --names | grep "$ws5" )
o6=$(bspc query -D -d .occupied --names | grep "$ws6" )

# check if Focused
f1=$(bspc query -D -d focused --names | grep "$ws1" )
f2=$(bspc query -D -d focused --names | grep "$ws2" )
f3=$(bspc query -D -d focused --names | grep "$ws3" )
f4=$(bspc query -D -d focused --names | grep "$ws4" )
f5=$(bspc query -D -d focused --names | grep "$ws5" )
f6=$(bspc query -D -d focused --names | grep "$ws6" )

ic_1=""
ic_2=""
ic_3=""
ic_4=""
ic_5=""
ic_6=""
if [ $f1 ]; then
    ic_1=""
elif [ $f2 ]; then
    ic_2=""
elif [ $f3 ]; then
    ic_3=""
elif [ $f4 ]; then
    ic_4=""
elif [ $f5 ]; then
    ic_5=""
elif [ $f6 ]; then
    ic_6=""
fi

echo 	"(box	:class \"works\"	:orientation \"h\" :spacing 5 :space-evenly \"false\" (button :onclick \"bspc desktop -f $ws1\"	:class	\"$un$o1$f1\"	\"$ic_1\") (button :onclick \"bspc desktop -f $ws2\"	:class \"$un$o2$f2\"	 \"$ic_2\") (button :onclick \"bspc desktop -f $ws3\"	:class \"$un$o3$f3\" \"$ic_3\") (button :onclick \"bspc desktop -f $ws4\"	:class \"$un$o4$f4\"	\"$ic_4\") (button :onclick \"bspc desktop -f $ws5\"	:class \"$un$o5$f5\" \"$ic_5\")  (button :onclick \"bspc desktop -f $ws6\"	:class \"$un$o6$f6\" \"$ic_6\"))"

}
workspaces
swaymsg subscribe desktop node_transfer | while read -r _ ; do
workspaces
done