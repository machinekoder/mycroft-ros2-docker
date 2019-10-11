#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source paths.sh

ROS_DISTRO=
source ${ROS2_PATH}/setup.bash

# fetch packages
mkdir -p ${ROS2_MSGS_WS_PATH}/src
cp include/ros2_msgs.rosinstall ${ROS2_MSGS_WS_PATH}/src/.rosinstall
cd ${ROS2_MSGS_WS_PATH}
wstool update -t src

# build
rm -rf build  install  log
colcon build
