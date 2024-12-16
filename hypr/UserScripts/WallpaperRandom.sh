#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

wallDIR="$HOME/Pictures/wallpapers"
scriptsDir="$HOME/.config/hypr/scripts"

focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

PICS=($(find ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


# Transition config
FPS=200
TYPE="simple"
FIT="fit"
BEZIER=".43,1.19,1,.4"
FILL=300040
SWWW_PARAMS="--resize $FIT --fill-color $FILL --transition-fps $FPS --transition-type $TYPE --transition-bezier $BEZIER"


swww query || swww-daemon --format xrgb && swww img -o $focused_monitor ${RANDOMPICS} $SWWW_PARAMS


${scriptsDir}/WallustSwww.sh
sleep 1
${scriptsDir}/Refresh.sh 

