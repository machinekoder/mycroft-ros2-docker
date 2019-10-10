#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source kill_proc.sh
source paths.sh

ROS_DISTRO=
source ${ROS1_PATH}/setup.bash
ROS_DISTRO=
source ${ROS2_PATH}/setup.bash
ROS_DISTRO=
source ${ROS1_MSGS_WS_PATH}/install_isolated/setup.bash
ROS_DISTRO=
source ${ROS2_MSGS_WS_PATH}/install/local_setup.bash
ROS_DISTRO=
source ${BRIDGE_WS_PATH}/install/local_setup.bash
set -x -e
ros2 run ros1_bridge dynamic_bridge --bridge-all-2to1-topics

set +x
kill_descendant_processes $$
