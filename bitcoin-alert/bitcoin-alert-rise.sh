#!/bin/bash

watch -n 5 "curl -s https://bitpay.com/rates/BTC/USD | grep -Po '[\.\d]+' | tee /dev/stderr | sed 's/\,//'  | sed -e 's/\(.*\)/\1>$1/' | bc | sed 's/$/*100/' | bc | sed 's/^0$/-100/' | xargs -I{} spd-say -i {} 'bitcoin up'"