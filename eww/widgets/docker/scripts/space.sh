#!/usr/bin/env bash

rows=$(docker system df)
images=$(echo "$rows" | grep Images | awk '{print $4}')
containers=$(echo "$rows" | grep Containers | awk '{print $4}')
volumes=$(echo "$rows" | grep Volumes | awk '{print $5}')
echo "{\"images\": \"${images}\", \"containers\": \"${containers}\", \"volumes\": \"${volumes}\"}"
