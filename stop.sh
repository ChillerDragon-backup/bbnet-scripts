#!/bin/bash
. path.sh

if (( $# != 1 )); then
    echo "Usage: $0 <server id -1 for all>"
    echo "Bugs: stopping server x also stops server xy (if x = 2 -> 20, 21, 22)"
    exit
fi

if [[ "$1" == "-1" ]]
then
    echo -e "\e[1;31m[-]\e[0m stopping all servers ..."
    pkill -f "./BanBans_srv server="
else
    echo -e "\e[1;31m[-]\e[0m stopping server $1 ..."
    pkill -f "./BanBans_srv server=$1"
fi

