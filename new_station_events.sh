#!/bin/sh

iw event |  awk '/new station/ {print $4}' | xargs -n 1 sh -c 'ubus send new_station {\"mac\":\"$1\"}' _
