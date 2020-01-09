#!/bin/bash

pid=$(pgrep -u zeta gnome-session | head -n 1)
dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//' )
export DBUS_SESSION_BUS_ADDRESS=$dbus
export HOME=/home/zeta
export DISPLAY=:0.0
/usr/bin/zenity --notification --text="$*"
