#!/bin/bash

watch -n 5 "curl -s -H 'Cache-Control: no-cache' https://coinmarketcap.com/currencies/bitcoin/?$(date +%s) | grep -Po  'priceValue.*?\/span' | grep -Po '[\d,.]+' | tee /dev/stderr | sed 's/\,//'  | sed -e 's/\(.*\)/\1<60000/' | bc | sed 's/$/*100/' | bc | sed 's/^0$/-100/' | xargs -I{} spd-say -i {} 'bitcoin alert'"