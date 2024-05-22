#!/usr/bin/env bash

cd "$(dirname "$0")"

# allow non-network local connections to X11 so that
# the GUI can be started from the Docker container:
xhost +local:

docker run -it \
    --privileged \
    --name lunarteam-kortex \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/:rw \
    --net bridge \
    ros2-lunarteam-kortex
    bash

