#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source paths.sh

ROS_DISTRO=
source ${ROS1_PATH}/setup.bash
ROS_DISTRO=
source ${ROS2_PATH}/setup.bash
ROS_DISTRO=
source ${ROS1_MSGS_WS_PATH}/install_isolated/setup.bash
ROS_DISTRO=
source ${ROS2_MSGS_WS_PATH}/install/local_setup.bash

cd ${BRIDGE_WS_PATH}
rm -rf build  install  log
colcon build --packages-select ros1_bridge --cmake-force-configure