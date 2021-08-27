#!/bin/bash

~/.config/regolith/bumblebee-status/bumblebee-status -m \
    todo spacer spacer nic publicip disk:root cpu memory battery spacer date time \
    -p \
    todo.file=~/.rofi_todos \
    root.path=/ \
    time.format="%H:%M" \
    date.format="%a, %b %d %Y" \
    nic.exclude="lo,virbr,docker,vboxnet,veth,br,.*:avahi,wlp*" \
    -a cpu memory battery disk \
    -t liamg
