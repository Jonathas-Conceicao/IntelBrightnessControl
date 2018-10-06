#! /bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
	echo "This script should be run as root"
	exit 1
fi

SCRIPT_PATH="/opt/lib"
SERVICE_PATH="/usr/lib/systemd/system"
FILE="intel-brightness-control"
if [ ! -d "$SCRIPT_PATH"/ ]; then
	mkdir --parent $SCRIPT_PATH
fi

cp $FILE.sh $SCRIPT_PATH/
cp $FILE.service $SERVICE_PATH/
systemctl enable intel-brightness-control
