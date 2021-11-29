#!/bin/bash

curl -s https://github.com/$1 | grep -B4 "^\s*contributions\s*$" | grep -Po "^\s*\d+\s*" | grep -Po "\d+" | sed 's/$/ contributions in the last year/'