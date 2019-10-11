#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source paths.sh

ROS_DISTRO=
source ${ROS2_PATH}/setup.bash
cd ${ROS2_MSGS_WS_PATH}
rm -rf build  install  log
colcon build
