#!/bin/sh

# The main idea is to write script what will create qtile-tv intro.
# It should contains window movenment.
# before start bars should be hidden if we want to have clean look.

# let's take group 7 as scene
qtile-cmd -o group 7 -f toscreen

# start from columns layout
qtile-cmd -o group 7 -f setlayout -a columns

# start recording
[ -e intro.mkv ] && rm intro.mkv
ffcast -vv rec intro.mkv &

sxiv -b logo/qtile_tv-logo-with_background-red.png &
sleep 1
sxiv -b logo/qtile_tv-logo-with_background-green.png &
sleep 1
sxiv -b logo/qtile_tv-logo-with_background-yellow.png &
sleep 1
sxiv -b logo/qtile_tv-logo-with_background-white.png &
sleep 1
qtile-cmd -o layout -f grow_left
sleep 1
qtile-cmd -o layout -f grow_left
sleep 1

# stop recording
pkill -fxn '(/\S+)*ffmpeg\s.*\sx11grab\s.*'
