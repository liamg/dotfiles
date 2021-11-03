#!/usr/bin/env bash

ip addr | grep 'state UP' | awk '{print $2}' | awk -F: '{print $1}' | sort | grep '^\(en\|wlp\)' | head -n1