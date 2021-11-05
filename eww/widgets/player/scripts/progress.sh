#!/usr/bin/env bash

playerctl metadata --format "{{duration(position)}}/{{duration(mpris:length)}}" --follow
