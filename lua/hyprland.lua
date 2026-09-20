local terminal = "uwsm app" -- $TERMINAL
local browser = "omarchy-launch-browser"

hl.config({
        general = {
            resize_on_border = true,
            extend_border_grab_area = 20,
            hover_icon_on_border = true,
            -- Use master layout instead of dwindle
            -- layout = master, -- I don't like this
            -- No gaps between windows
            gaps_in = 5,
            gaps_out = 10,
        },
        decoration = {
            -- Use round window corners
            rounding = 15,
            active_opacity = 1.5,
            inactive_opacity = 1.5,
            fullscreen_opacity = 1.5,
            blur = {
                enabled = true,
                size = 5,
                passes = 2,
                noise = 0.047, -- 0.0117
                contrast = 1.4, -- 0.8916
                brightness = 0.90,
                vibrancy = 0.0
            },
            shadow = {
                enabled = false,
            },
        },
        binds = {
            scroll_event_delay = 10,   -- in ms
            pass_mouse_when_bound = true,
        },
        cursor = {
            zoom_rigid = true,
            zoom_detached_camera = false,
        },
        input = {
            -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt
            kb_layout = "us,gr",
            kb_options = "caps:lock,grp:alt_shift_toggle",
            -- Change speed of keyboard repeat
            repeat_rate = 70,
            repeat_delay = 240,
            -- Start with numlock on by default
            numlock_by_default = false,
            -- Increase sensitity for mouse/trackpack (default: 0)
            -- sensitivity = 0.35
            touchpad = {
                -- Use natural (inverse) scrolling (You go up it goes down)
                natural_scroll = true,
                -- Use two-finger clicks for right-click instead of lower-right corner
                -- clickfinger_behavior = true
                -- Control the speed of your scrolling
                scroll_factor = 0.4,
            }
        }
    }
)

hl.on("hyprland.start", function ()
    hl.exec_cmd(terminal)
    hl.exec_cmd("ydotoold &")
end)

hl.monitor({
        output = "eDP-1",
        mode = "preferred",
        position = "0x0",
        scale = 1
    }
)

hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@60.00000",
        position = "auto",
        scale = 1
    }
)

hl.workspace_rule({workspace = "1", monitor = "eDP-1"})
hl.workspace_rule({workspace = "2", monitor = "eDP-1"})
hl.workspace_rule({workspace = "3", monitor = "eDP-1"})
hl.workspace_rule({workspace = "4", monitor = "eDP-1"})
hl.workspace_rule({workspace = "5", monitor = "eDP-1"})

hl.workspace_rule({workspace = "6", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "7", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "8", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "9", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "10", monitor = "HDMI-A-1"})

-- Bindings
hl.bind("SUPER + return", Terminal, exec, $terminal --working-directory="$(omarchy-cmd-terminal-cwd)")
hl.bind("SUPER + E", File manager, exec, uwsm app -- nautilus --new-window)
hl.bind("SUPER + B", Browser, exec, $browser)
hl.bind("SUPER + SHIFT + B", Browser (private), exec, $browser --private)
hl.bind("SUPER + N", Editor, exec, omarchy-launch-editor)
hl.bind("SUPER + C", Emacs ([C]ode), exec, emacs)
hl.bind("SUPER + T", Activity, exec, $terminal -e btop)
hl.bind("SUPER + D", Docker, exec, $terminal -e lazydocker)
hl.bind("SUPER + O", Opera, exec, opera)
hl.bind("SUPER + R", OBS ([R]ecord), exec, obs)
hl.bind("SUPER + slash", Passwords, exec, uwsm app -- 1password)
-- If your web app url contains --, type it as ---- to prevent hyperland treat it as comments)
hl.bind(SUPER, A, ChatGPT, exec, omarchy-launch-webapp "https://chatgpt.com")
hl.bind(SUPER SHIFT, A, Grok, exec, omarchy-launch-webapp "https://grok.com")
-- hl.bind(d = SUPER, Y, YouTube, exec, omarchy-launch-or-focus-webapp YouTube "https://youtube.com/")

-- This file has been configured to my liking
-- Only display the OSD on the currently focused monitor
local osdclient = "swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\""

-- Laptop multimedia keys for volume and LCD brightness (with OSD)
hl.bind(eld = SUPER, M, Mute, exec, $osdclient --output-volume mute-toggle
hl.bind(eld = SUPER SHIFT, M, Mute microphone, exec, $osdclient --input-volume mute-toggle
hl.bind(eld = SUPER, F6, Volume up, exec, $osdclient --output-volume raise
hl.bind(eld = SUPER, F5, Volume down, exec, $osdclient --output-volume lower
hl.bind(eld = SUPER, F4 , Brightness up, exec, $osdclient --brightness raise
hl.bind(eld = SUPER, F3, Brightness down, exec, $osdclient --brightness lower
-- Switch audio output with Super + Mute
hl.bind(ld = SUPER ALT, F3, Switch audio output, exec, omarchy-cmd-audio-switch

-- Precise 1% multimedia adjustments with Alt modifier
hl.bind(eld = SUPER SHIFT, F6, Volume up precise, exec, $osdclient --output-volume +1
hl.bind(eld = SUPER SHIFT, F5, Volume down precise, exec, $osdclient --output-volume -1
hl.bind(eld = SUPER SHIFT, F4, Brightness up precise, exec, $osdclient --brightness +1
hl.bind(eld = SUPER SHIFT, F3, Brightness down precise, exec, $osdclient --brightness -1

-- Requires playerctl
-- hl.bind(ld = , XF86AudioNext, Next track, exec, $osdclient --playerctl next
-- hl.bind(ld = , XF86AudioPause, Pause, exec, $osdclient --playerctl play-pause
-- hl.bind(ld = , XF86AudioPlay, Play, exec, $osdclient --playerctl play-pause
-- hl.bind(ld = , XF86AudioPrev, Previous track, exec, $osdclient --playerctl previous
--

hl.bind(e = SUPER, H, exec, ~/.config/hypr/scripts/cursor.sh -18 0
hl.bind(e = SUPER, L, exec, ~/.config/hypr/scripts/cursor.sh 18 0
hl.bind(e = SUPER, K, exec, ~/.config/hypr/scripts/cursor.sh 0 -18
hl.bind(e = SUPER, J, exec, ~/.config/hypr/scripts/cursor.sh 0 18
hl.bind( = SUPER, Y, exec, ydotool click 0xC0
hl.bind( = SUPER SHIFT, Y, exec, ydotool click 0xC1

-- Scroll through existing workspaces with SUPER + scroll
hl.bind(SUPER, mouse_up, Scroll active workspace forward, workspace, e+1)
hl.bind(SUPER, mouse_down, Scroll active workspace backward, workspace, e-1)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(md = SUPER CONTROL, mouse:272, Move window, movewindow
hl.bind(md = SUPER CONTROL, mouse:273, Resize window, resizewindow

hl.bind(SHIFT, mouse_down, Zoom in, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.3'))
hl.bind(SHIFT, mouse_up, Zoom out, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.7) | if . < 1 then 1 else . end'))

-- Done file
-- Move focus with SUPER + arrow keys
-- hl.bind(SUPER, H, Move focus left, movefocus, l
-- hl.bind(SUPER, L, Move focus right, movefocus, r
-- hl.bind(SUPER, K, Move focus up, movefocus, u
-- hl.bind(SUPER, J, Move focus down, movefocus, d

-- You need a different keyhl.bind( for this
hl.bind(SUPER, X, Scale up, exec, ~/.config/hypr/scripts/scale-up.sh
hl.bind(SUPER SHIFT, X, Scale down, exec, ~/.config/hypr/scripts/scale-down.sh -- scale down Zooms out 
hl.bind(SUPER SHIFT, I, Transparency up, exec, ~/.config/hypr/scripts/tr-up.sh
hl.bind(SUPER, I, Transparency down, exec, ~/.config/hypr/scripts/tr-down.sh -- scale down Zooms out 

-- Close windows
hl.bind(SUPER, W, Close active window, killactive,
hl.bind(CTRL ALT, DELETE, Close all Windows, exec, omarchy-cmd-close-all-windows
-- hl.bind(d = ALT, F11, Force full screen, fullscreen, 0
hl.bind(SUPER, F, Full width, fullscreen, 1

-- Control tiling
hl.bind(SUPER, Q, Toggle split, layoutmsg, togglesplit, -- dwindle -- from vertical to horizontal
hl.bind(SUPER, Z, Show key bindings, exec, omarchy-menu-keybindings
hl.bind(SUPER, G, Pseudo window, pseudo, -- dwindle -- Didn't do anythin
hl.bind(SUPER, U, Toggle floating, togglefloating, -- for Unhook
-- Zoom
hl.bind(SUPER, V, Zoom in, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.3')
hl.bind(SUPER SHIFT, V, Zoom out, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.7) | if . < 1 then 1 else . end')

-- Resize active window
hl.bind(SUPER, code:20, Expand window left, resizeactive, -100 0    -- - key
hl.bind(SUPER, code:21, Shrink window left, resizeactive, 100 0     -- = key
hl.bind(SUPER SHIFT, code:20, Shrink window up, resizeactive, 0 -100
hl.bind(SUPER SHIFT, code:21, Expand window down, resizeactive, 0 100

-- Swap active window with the one next to it with SUPER + SHIFT + arrow keys
hl.bind(SUPER, left, Swap window to the left, swapwindow, l
hl.bind(SUPER, right, Swap window to the right, swapwindow, r
hl.bind(SUPER, up, Swap window up, swapwindow, u
hl.bind(SUPER, down, Swap window down, swapwindow, d

-- Cycle through applications on active workspace
hl.bind(ALT, Tab, Cycle to next window, cyclenext
hl.bind(ALT SHIFT, Tab, Cycle to prev window, cyclenext, prev
hl.bind(SUPER, TAB, Next workspace, workspace, e+1
hl.bind(SUPER SHIFT, TAB, Previous workspace, workspace, e-1
hl.bind(SUPER CTRL, TAB, Former workspace, workspace, previous -- Kind of useless

-- Switch workspaces with SUPER + [0-9]
hl.bind(SUPER, code:10, Switch to workspace 1, workspace, 1
hl.bind(SUPER, code:11, Switch to workspace 2, workspace, 2
hl.bind(SUPER, code:12, Switch to workspace 3, workspace, 3
hl.bind(SUPER, code:13, Switch to workspace 4, workspace, 4
hl.bind(SUPER, code:14, Switch to workspace 5, workspace, 5
hl.bind(SUPER, code:15, Switch to workspace 6, workspace, 6
hl.bind(SUPER, code:16, Switch to workspace 7, workspace, 7
hl.bind(SUPER, code:17, Switch to workspace 8, workspace, 8
hl.bind(SUPER, code:18, Switch to workspace 9, workspace, 9
hl.bind(SUPER, code:19, Switch to workspace 10, workspace, 10

-- Move active window to a workspace with SUPER + SHIFT + [0-9]
hl.bind(SUPER SHIFT, code:10, Move window to workspace 1, movetoworkspace, 1
hl.bind(SUPER SHIFT, code:11, Move window to workspace 2, movetoworkspace, 2
hl.bind(SUPER SHIFT, code:12, Move window to workspace 3, movetoworkspace, 3
hl.bind(SUPER SHIFT, code:13, Move window to workspace 4, movetoworkspace, 4
hl.bind(SUPER SHIFT, code:14, Move window to workspace 5, movetoworkspace, 5
hl.bind(SUPER SHIFT, code:15, Move window to workspace 6, movetoworkspace, 6
hl.bind(SUPER SHIFT, code:16, Move window to workspace 7, movetoworkspace, 7
hl.bind(SUPER SHIFT, code:17, Move window to workspace 8, movetoworkspace, 8
hl.bind(SUPER SHIFT, code:18, Move window to workspace 9, movetoworkspace, 9
hl.bind(SUPER SHIFT, code:19, Move window to workspace 10, movetoworkspace, 10
-- The existance of these next two would negate the top two
-- Maybe if you sourced them in a different order somehow so that it playes the  bottom two firs
-- hl.bind(d = ALT, Tab, Reveal active window on top, bringactivetotop
-- hl.bind(d = ALT SHIFT, Tab, Reveal active window on top, bringactivetotop

-- Menus
hl.bind(SUPER, SPACE, Launch apps, exec, walker -p "Start…"
hl.bind(SUPER CTRL, E, Emoji picker, exec, walker -m Emojis
hl.bind(SUPER, S, Omarchy menu search, exec, omarchy-menu
hl.bind(SUPER, ESCAPE, Power menu, exec, omarchy-menu system
-- hl.bind(d = , XF86Calculator, Calculator, exec, gnome-calculator

-- Aesthetics
hl.bind(SUPER SHIFT, SPACE, Toggle top bar, exec, omarchy-toggle-waybar
hl.bind(SUPER CTRL, SPACE, Next background in theme, exec, omarchy-theme-bg-next
hl.bind(SUPER SHIFT CTRL, SPACE, Pick new theme, exec, omarchy-menu theme
hl.bind(SUPER, BACKSPACE, Toggle window transparency, exec, hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle

-- Notifications
hl.bind(SUPER, COMMA, Dismiss last notification, exec, makoctl dismiss
hl.bind(SUPER SHIFT, COMMA, Dismiss all notifications, exec, makoctl dismiss --all
hl.bind(SUPER CTRL, COMMA, Toggle silencing notifications, exec, makoctl mode -t do-not-disturb && makoctl mode | grep -q 'do-not-disturb' && notify-send "Silenced notifications" || notify-send "Enabled notifications"

-- Toggle idling
hl.bind(SUPER CTRL, I, Toggle locking on idle, exec, omarchy-toggle-idle
-- Toggle nightlight
hl.bind(SUPER CTRL, N, Toggle nightlight, exec, omarchy-toggle-nightlight

-- Screenshots
hl.bind(, PRINT, Screenshot of region, exec, omarchy-capture-screenshot
hl.bind(SHIFT, PRINT, Screenshot of window, exec, omarchy-capture-screenshot window
hl.bind(CTRL, PRINT, Screenshot of display, exec, omarchy-capture-screenshot output
-- Color picker
hl.bind(SUPER, PRINT, Color picker, exec, pkill hyprpicker || hyprpicker -a
-- File sharing
hl.bind(CTRL SUPER, S, Share, exec, omarchy-menu share

-- Screen recordings
hl.bind(ALT, PRINT, Screen record a region, exec, omarchy-cmd-screenrecord region
hl.bind(ALT SHIFT, PRINT, Screen record a region with audio, exec, omarchy-cmd-screenrecord region audio
hl.bind(CTRL ALT, PRINT, Screen record display, exec, omarchy-cmd-screenrecord output
hl.bind(CTRL ALT SHIFT, PRINT, Screen record display with audio, exec, omarchy-cmd-screenrecord output audio

-- Control Apple Display brightness
-- hl.bind(d = CTRL, F1, Apple Display brightness down, exec, omarchy-cmd-apple-display-brightness -5000
-- hl.bind(d = CTRL, F2, Apple Display brightness up, exec, omarchy-cmd-apple-display-brightness +5000
-- hl.bind(d = SHIFT CTRL, F2, Apple Display full brightness, exec, omarchy-cmd-apple-display-brightness +60000
