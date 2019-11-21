#!/bin/bash
if [ ! "$BASH_VERSION" ]; then
    echo "Warning: this script should be executed with bash"
    exec /bin/bash "$0"
fi
cd "$(dirname "${BASH_SOURCE[0]}")"
source kill_proc.sh
source paths.sh

set +e
source ${ROS2_PATH}/setup.bash
source ${ROS2_WS_PATH}/install/local_setup.bash

# start Respeaker ROS node if connect
pactl list short sinks | grep SEEED_ReSpeaker_4_Mic_Array
if [ $? -eq 0 ]; then
    echo "Respeaker connected"
    set -e -x
    ros2 run respeaker respeaker_node &
    pactl set-default-sink alsa_output.usb-SEEED_ReSpeaker_4_Mic_Array__UAC1.0_-00.analog-stereo
    pactl set-default-source alsa_input.usb-SEEED_ReSpeaker_4_Mic_Array__UAC1.0_-00.analog-mono
fi

set -e -x
# note: look in mycroft/configuration/locations.py
#export MYCROFT_SYSTEM_CONFIG="TODO"
cd ${MYCROFT_PATH}
./start-mycroft.sh debug

set +x
kill_descendant_processes $$
