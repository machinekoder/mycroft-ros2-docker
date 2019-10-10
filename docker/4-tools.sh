#!/bin/bash -xe
WANT_ENV="docker-build docker-run"
. $(dirname $0)/env.sh

# Ensure apt cache is up to date
apt-get update

###########################
# Tools
###########################

apt-get install -y \
    nano \
    tmux

###########################
# Clean up
###########################
apt-get clean
if test_environment docker-build; then
    rm -rf /root/.ccache
fi
