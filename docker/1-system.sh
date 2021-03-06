#!/bin/bash -xe
WANT_ENV="docker-build docker-run"
. $(dirname $0)/env.sh

###########################
# Update system & install general dependencies
###########################

apt-get update

apt-get install -y \
    iproute2 \
    pulseaudio

###########################
# Clean up
###########################
apt-get clean
