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
sxiv -b logo/qtile_tv-logo-with_background-cyan.png &
sleep 1
qtile-cmd -o layout -f grow_left
qtile-cmd -o layout -f grow_left
qtile-cmd -o layout -f grow_left
qtile-cmd -o layout -f grow_left
qtile-cmd -o layout -f grow_left
qtile-cmd -o layout -f grow_right
qtile-cmd -o layout -f grow_right
qtile-cmd -o layout -f grow_down
qtile-cmd -o layout -f grow_down
qtile-cmd -o layout -f grow_down
qtile-cmd -o layout -f grow_down
qtile-cmd -o layout -f grow_up
qtile-cmd -o layout -f grow_up
qtile-cmd -o layout -f grow_up
sleep 1
qtile-cmd -o layout -f toggle_split
sleep 1
qtile-cmd -o layout -f up
sleep 1
qtile-cmd -o layout -f up
sleep 1
qtile-cmd -o layout -f toggle_split
sleep 1
qtile-cmd -o layout -f shuffle_left
sleep 1
qtile-cmd -o layout -f right
sleep 1
qtile-cmd -o layout -f shuffle_right
sleep 1

qtile-cmd -o layout -f normalize
qtile-cmd -o group 7 -f setlayout -a monadtall
sleep 1
qtile-cmd -o layout -f maximize
sleep 1
qtile-cmd -o layout -f up
sleep 1
qtile-cmd -o layout -f maximize
sleep 1
qtile-cmd -o layout -f maximize
sleep 1
qtile-cmd -o layout -f normalize
sleep 1
qtile-cmd -o layout -f kill
sleep 1
qtile-cmd -o layout -f shuffle_left
sleep 1
qtile-cmd -o layout -f flip
sleep 1
qtile-cmd -o layout -f flip
sleep 1
qtile-cmd -o layout -f right
sleep 1
qtile-cmd -o layout -f maximize
sleep 1
qtile-cmd -o layout -f maximize
sleep 1
qtile-cmd -o layout -f left
qtile-cmd -o layout -f down
qtile-cmd -o layout -f down
sleep 1

qtile-cmd -o group 7 -f setlayout -a max
sleep 3

# stop recording
pkill -fxn '(/\S+)*ffmpeg\s.*\sx11grab\s.*'
