#!/usr/bin/env bash

set -e
source core.sh

WANT_VERSION=1.17

install_go () {
	log_info go "Installing go ${WANT_VERSION}..."
	rm /tmp/go.tar.gz 2>/dev/null || true
	curl -sL "https://golang.org/dl/go${WANT_VERSION}.linux-amd64.tar.gz" -o /tmp/go.tar.gz
	sudo rm -rf /usr/local/go 2>/dev/null || true
	sudo tar -C /usr/local -xzf "/tmp/go.tar.gz" >/dev/null
}

log_info go "Checking installation..."
which go >/dev/null 2>&1 || install_go
version=$(GOROOT="" /usr/local/go/bin/go version || true)
[[ ! "$version" = "$WANT_VERSION" ]] || install_go
log_success go "Go ${WANT_VERSION} installed."

