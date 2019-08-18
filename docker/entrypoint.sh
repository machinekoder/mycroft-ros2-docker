#!/bin/bash -e

# add hostname to hosts
sh -c 'echo "127.0.2.1  `hostname`" >> /etc/hosts'

# Add user and group to system
echo "${USER}:x:${UID}:${GID}::${HOME}:/bin/bash" >>/etc/passwd
echo "${USER}:x:${GID}:" >>/etc/group
sed -i '/.*sudo.*:/ s/$/'${USER}'/' /etc/group
sed -i '/.*audio.*:/ s/$/,'${USER}'/' /etc/group
sed -i '/.*pulse.*:/ s/$/,'${USER}'/' /etc/group
sed -i '/.*pulse-access.*:/ s/$/,'${USER}'/' /etc/group

#source /opt/ros/melodic/setup.bash
#source /opt/ros/dashing/setup.bash

export ROS_IP=127.0.0.1
export ROS_MASTER_URI=http://127.0.0.1:11311

# Run command as user
default_cmd=(/bin/bash --login -i)
exec sudo -u ${USER} -E "${@:-${default_cmd[@]}}"
