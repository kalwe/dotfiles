#!/usr/bin/env bash

connection_type="$1"

if [[ "${connection_type}" == "wireless" ]]; then
        ip link set wlp2s0 down
        macchanger -A wlp2s0
        ip link set wlp2s0 up
elif [[ "${connection_type}" == "wired" ]]; then
        ip link set enp1s0 down
        macchanger -A enp1s0
        ip link set enp1s0 up
fi
