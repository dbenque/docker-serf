#!/bin/sh

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

# installs curl and unzip if missing
command_exists curl || yum install -y curl
command_exists unzip || yum install -y unzip

# installs serf binary
TEMP_ZIP=/tmp/serf.zip
SERF_HOME=/usr/local/serf
SERF_BIN=$SERF_HOME/bin/serf

curl -Lso $TEMP_ZIP https://dl.bintray.com/mitchellh/serf/0.6.0_linux_amd64.zip
unzip $TEMP_ZIP -d $(dirname $SERF_BIN)
ln -s $SERF_BIN /usr/local/bin/serf
rm $TEMP_ZIP
