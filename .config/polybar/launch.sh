#!/usr/bin/env bash
#Terminate already running bar instances
killall -q polybar
echo "----" | tee -a /tmp/polybar1.log 
polybar topbar  >> /tmp/polybar2.log 2>&1 &

echo "Bars launched..."

