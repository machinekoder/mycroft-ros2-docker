#!/bin/bash -xe
WANT_ENV="docker-build docker-run"
. $(dirname $0)/env.sh

# Ensure apt cache is up to date
apt-get update

###########################
# Tools
###########################

apt-get install -y git python3 python3-dev python3-setuptools libtool libffi-dev libssl-dev autoconf automake bison swig libglib2.0-dev portaudio19-dev mpg123 screen flac curl libicu-dev pkg-config libjpeg-dev libfann-dev build-essential jq locales

mkdir -p /var/log/mycroft/
chmod -R 757 /var/log/mycroft/

# git clone https://github.com/MycroftAI/mycroft-core.git /tmp/mycroft --depth=1
# cd /tmp/mycroft
# echo '{"use_branch": "master", "auto_update": true}' > .dev_opts.json
# ./dev_setup.sh --allow-root -sm
# rm -rf .venv
# rm -rf /opt/mycroft


###########################
# Clean up
###########################
apt-get clean
if test_environment docker-build; then
    rm -rf /root/.ccache
fi
