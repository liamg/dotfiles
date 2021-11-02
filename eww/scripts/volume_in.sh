#!/usr/bin/env bash
while true; do
amixer -D pulse sget Capture | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%' | head -1
sleep 1
done
