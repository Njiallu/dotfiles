#!/usr/bin/env sh
DISPLAY=:0

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -rq top &
  done
else
  polybar -rq top &
fi

