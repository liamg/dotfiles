#/usr/bin/env bash

set -e

################################################################
# Variables
################################################################
XDG_CONFIG_HOME="${HOME}/.config"


################################################################
# Package management
################################################################
install_package () {
	log_info packages "Installing $1..."
    sudo apt update >/dev/null 2>&1
    sudo apt install -o Dpkg::Options::="--force-overwrite" -y "$1" >/dev/null 2>&1
}

check_package_installed () {
    package=$1
	log_info packages "Checking $package is installed..."
	apt -qq list "$package" 2>/dev/null | grep '\[installed' >/dev/null || install_package "$package"
    log_success packages "$1 is installed!"
}

################################################################
# Logging
################################################################
red=31
green=32
yellow=33
blue=34

core_category=core

log_info () {
    category=$core_category
    if [[ $# -gt 1 ]]; then
        category=$1
        shift
    fi
    msg="$*"
    log_internal "$blue" "$category" "$msg"
}

log_warning () {
   category=$core_category
    if [[ $# -gt 1 ]]; then
        category=$1
        shift
    fi
    msg="$*"
    log_internal "$yellow" "$category" "$msg"
}

log_error () {
   category=$core_category
    if [[ $# -gt 1 ]]; then
        category=$1
        shift
    fi
    msg="$*"
    log_internal "$red" "$category" "$msg"
}

log_success () {
    category=$core_category
    if [[ $# -gt 1 ]]; then
        category=$1
        shift
    fi
    msg="$*"
    log_internal "$green" "$category" "$msg"
}

panic () {
    category=$core_category
    if [[ $# -gt 1 ]]; then
        category=$1
        shift
    fi
    msg="$*"
    log_internal "$red" "$category" "$msg"
    exit 1
}

log_internal() {
    colour="$1"
    category="$2"
    msg="$3"
    echo -e "\x1b[0m[\x1b[${colour}m${category}\x1b[0m]\x1b[${colour}m $msg"
}
################################################################

