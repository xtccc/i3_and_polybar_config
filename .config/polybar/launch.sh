

###
 # @Author: small_parking
 # @Date: 2020-05-13 22:11:45
 # @LastEditors: small_parking
 # @LastEditTime: 2020-05-13 22:11:46
 ###


###
 # @Author: small_parking
 # @Date: 2020-05-13 22:11:45
 # @LastEditors: small_parking
 # @LastEditTime: 2020-05-13 22:11:45
 ###
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload -c ~/.config/polybar/config.ini main &
    done
else
    polybar --reload -c ~/.config/polybar/config.ini main &
fi