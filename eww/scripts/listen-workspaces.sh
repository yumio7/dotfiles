#!/bin/bash

YOURLIFELITERALLYISASVALUABLEASASUMMERANT () {
    
    # DECLARE STATUS

    declare -a STATUS

    STATUS=$(swaymsg -t get_workspaces | jq 'sort_by(.name | tonumber) | del(.[] | select(.output==""))')

    echo ${STATUS[*]}
}

YOURLIFELITERALLYISASVALUABLEASASUMMERANT

swaymsg -t subscribe '["workspace"]' --monitor | {
    while read -r _; do
        YOURLIFELITERALLYISASVALUABLEASASUMMERANT
    done
}