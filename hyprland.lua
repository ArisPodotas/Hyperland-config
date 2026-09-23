-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

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

hl.curve("overshoot", { type = "bezier", points = { {0.5, 0.9}, {0.1, 1.1} } } ) 
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = 'overshoot', curve = "default", style = "slidefade 20%" })

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
        mode = "preferred",
        position = "1920x0",
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

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "9" })
hl.unbind("SUPER + SHIFT + RETURN")
hl.unbind("SUPER + SHIFT + ALT + B")
hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + k")
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + SHIFT + N")
hl.unbind("SUPER + SHIFT + P")
-- hl.unbind("SUPER + j")

local terminal = "omarchy-launch-terminal" -- $TERMINAL
local browser = "omarchy-launch-browser"

o.bind("SUPER + Z", "Show key bindings", "omarchy-menu-keybindings")

-- o.bind("SUPER + RETURN", "Terminal", terminal)
o.bind("SUPER + E", "File manager", "uwsm app -- nautilus --new-window")
o.bind("SUPER + B", "Browser", browser)
o.bind("SUPER + SHIFT + B", "Browser (private)", browser .. " --private")
o.bind("SUPER + N", "Launch Editor", "omarchy-launch-editor")
-- o.bind("SUPER + C", "Emacs ([C]ode)", "emacs")
o.bind("SUPER + T", "Activity", terminal .. " -e btop")
o.bind("SUPER + D", "Docker", terminal .. " -e lazydocker")
o.bind("SUPER + O", "Opera", "opera") -- Problem right now
o.bind("SUPER + R", "OBS ([R]ecord)", "obs")
-- o.bind("SUPER + slash", "Passwords", "uwsm app -- 1password")
-- If your web app url contains --, type it as ---- to prevent hyperland treat it as comments)
o.bind("SUPER + A", "ChatGPT", "omarchy-launch-webapp \"https://chatgpt.com\"")
o.bind("SUPER + SHIFT + A", "Grok","omarchy-launch-webapp \"https://grok.com\"")

o.bind("SUPER + H", "Move cursor left", "~/.config/hypr/scripts/cursor.sh -18 0")
o.bind("SUPER + L", "Move cursor right", "~/.config/hypr/scripts/cursor.sh 18 0")
o.bind("SUPER + K", "Move cursor up", "~/.config/hypr/scripts/cursor.sh 0 -18")
o.bind("SUPER + J", "Move cursor down", "~/.config/hypr/scripts/cursor.sh 0 18")
o.bind("SUPER + Y", "Left Click", "ydotool click 0xC0")
o.bind("SUPER + SHIFT + Y", "Right Click", "ydotool click 0xC1")

-- o.bind("SUPER + SHIFT + I", "Transparency up", "~/.config/hypr/scripts/tr-up.sh")
-- o.bind("SUPER + I", "Transparency down", "~/.config/hypr/scripts/tr-down.sh") -- scale down Zooms out 
-- o.bind("SUPER + V", "Zoom in", "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.3'")
-- o.bind("SUPER + SHIFT + V", "Zoom out", "hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.7) | if . < 1 then 1 else . end'")
