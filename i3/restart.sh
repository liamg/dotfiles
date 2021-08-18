#!/usr/bin/env bash

set -e
source core.sh

# restart i3 with new settings
log_info i3 "Restarting i3 with new configuration..."
regolith-look set midnight
regolith-look refresh
i3-msg reload >/dev/null
i3-msg restart >/dev/null
log_success i3 "i3 was restarted!"

