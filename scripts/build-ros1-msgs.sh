#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source paths.sh

ROS_DISTRO=
source ${ROS1_PATH}/setup.bash
cd ${ROS1_MSGS_WS_PATH}
rm -rf build_isolated  devel_isolated  install_isolated
catkin_make_isolated --install
