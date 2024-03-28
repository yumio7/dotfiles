#!/bin/bash

echo "default";
while true; do
    swaymsg -t subscribe '["mode"]' | jq '.change' | cut -d '"' -f2;
done