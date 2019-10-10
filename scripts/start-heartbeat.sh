#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source kill_proc.sh
source paths.sh

source ${ROS2_PATH}/setup.bash
source ${ROS2_WS_PATH}/install/local_setup.bash
set -e -x
ros2 run heartbeat heartbeat_publisher

set +x
kill_descendant_processes $$
