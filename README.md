# Disclaimer

This config is for Omarchy operating systems, it was designed on an omarchy desktop. Master refers to omarchy, shouldn't matter too much I don't think.

# Notes

You should make sure to comment out the config files form the .local dir when you are don't with a file since if you have not overwritten a keybind then it will remain in the pc. Make sure not to edit any files in the .local since then the next update may make a merge conflict.

You need to run
hyprctl monitors
to get the monitor name and then add it to the monitors.conf file in case f a new hdmi device.

# Todo

- [ ] Make init commands for opening the common applications on startup (now in the hook file)
- [ ] Fix the last util keybind file
