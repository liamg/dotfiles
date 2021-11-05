#!/usr/bin/env bash

# grab active ethernet/wireless interface - prioritise ethernet first
ip addr | grep 'state UP' | awk '{print $2}' | awk -F: '{print $1}' | sort | grep '^\(en\|wlp\)' | head -n1

