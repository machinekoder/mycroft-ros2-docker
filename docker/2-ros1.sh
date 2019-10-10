#!/bin/bash -xe
WANT_ENV="docker-build docker-run"
. $(dirname $0)/env.sh

###########################
# Update system & install general dependencies
###########################
echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
apt-get update

apt-get install -y \
    ros-dashing-ros1-bridge \
    ros-dashing-demo-nodes-cpp \
    ros-dashing-demo-nodes-py \
    ros-dashing-launch-testing-ament-cmake

###########################
# Clean up
###########################
apt-get clean
