#!/usr/bin/env bash

screen=$1
sname=$(xrandr --listactivemonitors | grep "${screen}:" | awk '{print $4}')
while true; do
  workspaces=$(i3-msg -t get_workspaces | jq -r ".[] | select(.output | contains(\"${sname}\")) | \"\(.focused):\(.name)\"")
  echo -n '(box '
  for workspace in $workspaces; do
    focused=$(echo "$workspace" | awk -F: '{print $1}')
    name=$(echo "$workspace" | awk -F: '{print $2}')
    class=""
    if [[ "$focused" = "true" ]]; then
      class=active
    fi
    echo -n '(button '
    echo -n ":class \"${class}\" "
    echo -n ":onclick \"i3-msg workspace '${name}'\" "
    echo -n "(label :text \"${name:1}\")"
    echo -n ')'
  done
  echo ')'
  sleep 0.1
done

#i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2
