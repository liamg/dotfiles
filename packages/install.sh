#!/usr/bin/env bash

set -e
source core.sh

while IFS= read -r line
do
  check_package_installed $line
done < packages/list

