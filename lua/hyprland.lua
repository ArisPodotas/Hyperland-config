local osdclient = "swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\""

-- Laptop multimedia keys for volume and LCD brightness (with OSD)
o.bind(eld = SUPER, M, Mute, exec, $osdclient --output-volume mute-toggle
o.bind(eld = SUPER SHIFT, M, Mute microphone, exec, $osdclient --input-volume mute-toggle
o.bind(eld = SUPER, F6, Volume up, exec, $osdclient --output-volume raise
o.bind(eld = SUPER, F5, Volume down, exec, $osdclient --output-volume lower
o.bind(eld = SUPER, F4 , Brightness up, exec, $osdclient --brightness raise
o.bind(eld = SUPER, F3, Brightness down, exec, $osdclient --brightness lower
-- Switch audio output with Super + Mute
o.bind(ld = SUPER ALT, F3, Switch audio output, exec, omarchy-cmd-audio-switch

-- Precise 1% multimedia adjustments with Alt modifier
o.bind(eld = SUPER SHIFT, F6, Volume up precise, exec, $osdclient --output-volume +1
o.bind(eld = SUPER SHIFT, F5, Volume down precise, exec, $osdclient --output-volume -1
o.bind(eld = SUPER SHIFT, F4, Brightness up precise, exec, $osdclient --brightness +1
o.bind(eld = SUPER SHIFT, F3, Brightness down precise, exec, $osdclient --brightness -1

-- Requires playerctl
-- o.bind(ld = , XF86AudioNext, Next track, exec, $osdclient --playerctl next
-- o.bind(ld = , XF86AudioPause, Pause, exec, $osdclient --playerctl play-pause
-- o.bind(ld = , XF86AudioPlay, Play, exec, $osdclient --playerctl play-pause
-- o.bind(ld = , XF86AudioPrev, Previous track, exec, $osdclient --playerctl previous
--

-- Scroll through existing workspaces with SUPER + scroll
o.bind(SUPER, mouse_up, Scroll active workspace forward, workspace, e+1)
o.bind(SUPER, mouse_down, Scroll active workspace backward, workspace, e-1)

-- Move/resize windows with mainMod + LMB/RMB and dragging
o.bind(md = SUPER CONTROL, mouse:272, Move window, movewindow
o.bind(md = SUPER CONTROL, mouse:273, Resize window, resizewindow

o.bind(SHIFT, mouse_down, Zoom in, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.3'))
o.bind(SHIFT, mouse_up, Zoom out, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.7) | if . < 1 then 1 else . end'))

-- Close windows
o.bind(CTRL ALT, DELETE, Close all Windows, exec, omarchy-cmd-close-all-windows
-- o.bind(d = ALT, F11, Force full screen, fullscreen, 0
o.bind(SUPER, F, Full width, fullscreen, 1

-- Control tiling
o.bind(SUPER, Q, Toggle split, layoutmsg, togglesplit, -- dwindle -- from vertical to horizontal
o.bind(SUPER, G, Pseudo window, pseudo, -- dwindle -- Didn't do anythin
o.bind(SUPER, U, Toggle floating, togglefloating, -- for Unhook
-- Zoom

-- Resize active window
o.bind(SUPER, code:20, Expand window left, resizeactive, -100 0    -- - key
o.bind(SUPER, code:21, Shrink window left, resizeactive, 100 0     -- = key
o.bind(SUPER SHIFT, code:20, Shrink window up, resizeactive, 0 -100
o.bind(SUPER SHIFT, code:21, Expand window down, resizeactive, 0 100

-- Swap active window with the one next to it with SUPER + SHIFT + arrow keys
o.bind(SUPER, left, Swap window to the left, swapwindow, l
o.bind(SUPER, right, Swap window to the right, swapwindow, r
o.bind(SUPER, up, Swap window up, swapwindow, u
o.bind(SUPER, down, Swap window down, swapwindow, d

-- Cycle through applications on active workspace
o.bind(ALT, Tab, Cycle to next window, cyclenext
o.bind(ALT SHIFT, Tab, Cycle to prev window, cyclenext, prev
o.bind(SUPER, TAB, Next workspace, workspace, e+1
o.bind(SUPER SHIFT, TAB, Previous workspace, workspace, e-1
o.bind(SUPER CTRL, TAB, Former workspace, workspace, previous -- Kind of useless

-- Menus
o.bind(SUPER, SPACE, Launch apps, exec, walker -p "Start…"
o.bind(SUPER CTRL, E, Emoji picker, exec, walker -m Emojis
o.bind(SUPER, S, Omarchy menu search, exec, omarchy-menu
o.bind(SUPER, ESCAPE, Power menu, exec, omarchy-menu system
-- o.bind(d = , XF86Calculator, Calculator, exec, gnome-calculator

-- Aesthetics
o.bind(SUPER SHIFT, SPACE, Toggle top bar, exec, omarchy-toggle-waybar
o.bind(SUPER CTRL, SPACE, Next background in theme, exec, omarchy-theme-bg-next
o.bind(SUPER SHIFT CTRL, SPACE, Pick new theme, exec, omarchy-menu theme
o.bind(SUPER, BACKSPACE, Toggle window transparency, exec, hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle

-- Notifications
o.bind(SUPER, COMMA, Dismiss last notification, exec, makoctl dismiss
o.bind(SUPER SHIFT, COMMA, Dismiss all notifications, exec, makoctl dismiss --all
o.bind(SUPER CTRL, COMMA, Toggle silencing notifications, exec, makoctl mode -t do-not-disturb && makoctl mode | grep -q 'do-not-disturb' && notify-send "Silenced notifications" || notify-send "Enabled notifications"

-- Toggle idling
o.bind(SUPER CTRL, I, Toggle locking on idle, exec, omarchy-toggle-idle
-- Toggle nightlight
o.bind(SUPER CTRL, N, Toggle nightlight, exec, omarchy-toggle-nightlight

-- Screenshots
o.bind(, PRINT, Screenshot of region, exec, omarchy-capture-screenshot
o.bind(SHIFT, PRINT, Screenshot of window, exec, omarchy-capture-screenshot window
o.bind(CTRL, PRINT, Screenshot of display, exec, omarchy-capture-screenshot output
-- Color picker
o.bind(SUPER, PRINT, Color picker, exec, pkill hyprpicker || hyprpicker -a
-- File sharing
o.bind(CTRL SUPER, S, Share, exec, omarchy-menu share

-- Screen recordings
o.bind(ALT, PRINT, Screen record a region, exec, omarchy-cmd-screenrecord region
o.bind(ALT SHIFT, PRINT, Screen record a region with audio, exec, omarchy-cmd-screenrecord region audio
o.bind(CTRL ALT, PRINT, Screen record display, exec, omarchy-cmd-screenrecord output
o.bind(CTRL ALT SHIFT, PRINT, Screen record display with audio, exec, omarchy-cmd-screenrecord output audio
