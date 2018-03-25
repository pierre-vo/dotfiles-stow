# From https://wayland.freedesktop.org/libinput/doc/1.7.3/touchpad_pressure.html

# sudo evemu-record
# to see a list of devices and select the touchpad device
# /dev/input/event12 for x240
sudo evemu-record /dev/input/event12 > touchpad-pressure.txt
# Now move a finger at normal pressure several times around the touchpad, as if moving the cursor normally around the screen. Avoid any accidental palm touches or any excessive or light pressure.

# The event recording is then filtered for pressure information, which is sorted and exported to a new file:
grep --only-matching "ABS_MT_PRESSURE[ ]*[0-9]*" touchpad-pressure.txt | \
        sed -e "s/ABS_MT_PRESSURE[ ]*//" | \
        sort -n | uniq -c > touchpad-pressure-statistics.txt

# The file contains a list of (count, pressure-value) tuples which can be visualized with gnuplot. Copy the following into a file named touchpad-pressure-statistics.gnuplot:

# set style data lines
# plot 'touchpad-pressure-statistics.txt' using 2:1
# pause -1

# Now, you can visualize the touchpad pressure curve with the following command:
gnuplot touchpad-pressure-statistics.gnuplot

# The visualization will show a curve with the various pressure ranges, see this bugzilla attachment. In most cases, the thresholds can be guessed based on this curve. libinput employes a Schmitt trigger with an upper threshold and a lower threshold. A touch is detected when the pressure goes above the high threshold, a release is detected when the pressure fallse below the low threshold. Thus, an ideal threshold combination is with a high threshold slightly above the minimum threshold, a low threshold on the minimum threshold.


# sudo udevadm hwdb --update
# sudo udevadm test /sys/class/input/eventX
