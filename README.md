# Disclaimer

This config is for the Omarchy operating systems, it was designed on an Omarchy desktop. The master branch refers to Omarchy, shouldn't matter too much I don't think.

# Notes

You should make sure to comment out the config files form the .local dir when you are done with a file, since if you have not overwritten a keybind then it will remain in the runtime. Make sure not to edit any files in the .local since then the next update may make a merge conflict.

To get the monitor name and then add it to the monitors.conf file in case of a new hdmi device run:
```hyprctl monitors```

To add a moving wallpaper the way I have installed things
```exec-once = mpvpaper -o "no-audio loop" eDP-1 ~/Wallpapers/DanDaDanedited.webm```
and
```exec-once = mpvpaper -o "no-audio loop" HDMI-A-1 ~/Wallpapers/DanDaDanedited.webm```

# Todo

- [ x ] Migrate to lua
