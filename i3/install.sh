#!/usr/bin/env bash

set -e
source core.sh

i3configdir=$XDG_CONFIG_HOME/regolith/i3
i3config=$i3configdir/config

# ensure directory exists
log_info i3 "Checking user config exists..."
mkdir -p $i3configdir

log_info i3  "Rebuilding configuration..."
cp /etc/regolith/i3/config $i3config
cat i3/config >> $i3config

