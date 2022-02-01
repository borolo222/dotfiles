#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
#killall -q synergys
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r base &
polybar -r ext &
echo "Polybar launched..."


