#!/bin/sh

export DISPLAY=:0.0

[ -f "/tmp/.X0-lock" ] && Xvfb :0 -nocursor -screen 0 1024x768x24 &

mono /eco_server/EcoServer.exe "$@"
