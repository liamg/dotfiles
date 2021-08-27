#!/usr/bin/env bash

set -e
source core.sh

while IFS= read -r line
do
  check_package_installed $line
done < packages/list

which spt >/dev/null 2>&1 || snap install spt 2>/dev/null

ln -sf $(which fdfind) ~/.local/bin/fd

