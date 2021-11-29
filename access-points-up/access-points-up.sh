#!/bin/bash

watch -n 10 "iwlist $1 scanning | grep SSID | sed 's/.*SSID://' | sed 's/\"//g' | grep -P '$2' |  tee /dev/stderr | tr '\r\n' ' ' | sed 's/^.*$/AP found/' | xargs -I{} spd-say {}"