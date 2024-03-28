#!/bin/bash

YOURLIFELITERALLYISASVALUABLEASASUMMERANT () {
    
    # DECLARE WORKSPACES

    declare -a WORKSPACES

    # GIVE THE WORKSPACES A NUMBER

    for i in {0..9}
    do
        WORKSPACES[$i]=$(swaymsg -t get_workspaces | jq .[$i].name | awk -F '[^0-9]*' '$0=$2')
    done


    # DECLARE STATUS

    declare -a STATUS

    # GIVE THE STATUS A TRUE OR A FALSE OR A NULL

    for i in {0..9}
    do
        STATUS[$i]=$(swaymsg -t get_workspaces | jq .[$i].focused)
    done

    # GIVE INACTIVE WORKSPACES SOMETHING
    # REMOVE IF YOU DON'T WANT INACTIVE WORKSPACES TO SHOW UP
    
    for j in {0..9}
    do
        if [ ${STATUS[$j]} == "false" ]; then
            WORKSPACES[$j]=""
        elif [ ${STATUS[$j]} == "true" ]; then
            WORKSPACES[$j]=""
        fi
    done

    echo ${WORKSPACES[*]}
}

YOURLIFELITERALLYISASVALUABLEASASUMMERANT

swaymsg -t subscribe '["workspace"]' --monitor | {
    while read -r _; do
        YOURLIFELITERALLYISASVALUABLEASASUMMERANT
    done
}