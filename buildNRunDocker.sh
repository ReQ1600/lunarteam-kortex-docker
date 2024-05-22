#!/usr/bin/env bash

cd "$(dirname "$0")"

# allow non-network local connections to X11 so that
# the GUI can be started from the Docker container:
xhost +local:

docker build . -t ros2-lunarteam-kortex

bash runDocker.sh
