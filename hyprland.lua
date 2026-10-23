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

hl.config(
    {
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
        },
        misc = {
            middle_click_paste = false,
        }
    }
)

hl.curve("overshoot", { type = "bezier", points = { {0.5, 0.9}, {0.1, 1.1} } } )
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = 'overshoot', curve = "default", style = "slidefade 20%" })

-- Invert positions for inverted monitors
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

hl.workspace_rule({workspace = "1", monitor = "eDP-1", default_name = "File Navigator"})
hl.workspace_rule({workspace = "2", monitor = "eDP-1", default_name = "Discord"})
hl.workspace_rule({workspace = "3", monitor = "eDP-1", default_name = "Video"})
hl.workspace_rule({workspace = "4", monitor = "eDP-1"})
hl.workspace_rule({workspace = "5", monitor = "eDP-1"})
hl.workspace_rule({workspace = "6", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "7", monitor = "HDMI-A-1"})
hl.workspace_rule({workspace = "8", monitor = "HDMI-A-1", default_name = "Zotero"})
hl.workspace_rule({workspace = "9", monitor = "HDMI-A-1", default_name = "Browser"})
hl.workspace_rule({workspace = "10", monitor = "HDMI-A-1", default_name = "Editor"})

-- hl.on("hyprland.start", function ()
--     hl.dsp.focus({workspace = "10"})
--     hl.exec_cmd('omarchy-launch-editor')
-- end)

-- hl.unbind("SUPER + RETURN") -- term
hl.unbind("SUPER + SHIFT + RETURN")
hl.unbind("SUPER + SHIFT + ALT + B") -- browser
hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + SHIFT + S") -- google maps
hl.unbind("SUPER + SHIFT + F") -- file navigator
hl.unbind("SUPER + ALT + SHIFT + F") -- file navigator
hl.unbind("SUPER + SHIFT + N") -- editor
hl.unbind("SUPER + SHIFT + P") -- google photos
hl.unbind("SUPER + V") -- paste
hl.unbind("SUPER + C") -- copy
hl.unbind("SUPER + X") -- cut
hl.unbind("SUPER + CTRL + V") -- clipboard (rebound later)
-- hl.unbind("SUPER + W")
-- hl.unbind("ALT + Tab")
hl.unbind("SUPER + J") -- toggle split window
hl.unbind("SUPER + K") -- keybinds
-- hl.unbind("SUPER + H") -- was nothing unset
hl.unbind("SUPER + L") -- toggle workspace layout
-- hl.unbind("SUPER + Y") -- does nothing
hl.unbind("SUPER + SHIFT + Y") -- youtube
hl.unbind("SUPER + ALT + RETURN") -- tmux
hl.unbind("SUPER + CTRL + RETURN") -- herdr
hl.unbind("SUPER + SHIFT + M") -- spotify
hl.unbind("SUPER + SHIFT + ALT + M") -- cliamp
hl.unbind("SUPER + SHIFT + D") -- docker
hl.unbind("SUPER + SHIFT + G") -- signal
hl.unbind("SUPER + SHIFT + O") -- launch of focus obsidian
hl.unbind("SUPER + SHIFT + W") -- omawrite
hl.unbind("SUPER + SHIFT + SLASH") -- 1password
hl.unbind("SUPER + SHIFT + A") -- chatgpt
hl.unbind("SUPER + SHIFT + ALT + A") -- grok
hl.unbind("SUPER + SHIFT + C") -- webapp calendar (their own thing)
hl.unbind("SUPER + SHIFT + E") -- email
hl.unbind("SUPER + SHIFT + ALT + E") -- new email
hl.unbind("SUPER + SHIFT + ALT + G") -- whatsapp
hl.unbind( "SUPER + SHIFT + CTRL + G") -- google messages
hl.unbind("SUPER + SHIFT + X") -- x 
hl.unbind("SUPER + SHIFT + ALT + X") -- x new post
hl.unbind("SUPER + mouse_down") -- scroll workspaces
hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + T") -- Toggle window floating tiling -> new is U
hl.unbind("SUPER + ALT + Home")
hl.unbind("SUPER + Home")
hl.unbind("SUPER + CTRL + F")
hl.unbind("SUPER + O")
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + RIGHT")
hl.unbind("SUPER + UP")
hl.unbind("SUPER + DOWN")
hl.unbind("SUPER + CTRL + Z")
hl.unbind("SUPER + CTRL + ALT + Z")

-- hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("omarchy-launch-terminal"), {description = "Terminal"})
-- hl.bind("SUPER + W", hl.dsp.window.close(), {descriptin = "Close window"})
-- hl.bind("ALT + Tab", function()
--     hl.dispatch(hl.dsp.window.cycle_next())
--     hl.dispatch(hl.dsp.window.bring_to_top())
-- end, {description = "Change Focus"})
-- hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind("SUPER + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("omarchy-menu-keybindings"), {description = "Show key bindings"})
hl.bind("SUPER + C", hl.dsp.exec_cmd("omarchy-shell shell toggle omarchy.clipboard"), {description = "Clipboard manager"})
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- nautilus --new-window"), {description = "File manager"})
hl.bind("SUPER + N", hl.dsp.exec_cmd("omarchy-launch-editor"), {description = "Launch Editor"})
hl.bind("SUPER + T", hl.dsp.exec_cmd("omarchy-launch-terminal -e btop"), {description = "Activity"})
-- hl.bind("SUPER + D", hl.dsp.exec_cmd("omarchy-launch-terminal -e lazydocker"), {description = "Docker"})
hl.bind("SUPER + O", hl.dsp.exec_cmd("opera"), {description = "Opera"})
hl.bind("SUPER + B", hl.dsp.exec_cmd("omarchy-launch-browser"), {description = "Browser"})
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("omarchy-launch-browser --private"), {descriptin = "Browser (private)"})
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("opera --private"), {description = "Opera"})
hl.bind("SUPER + R", hl.dsp.exec_cmd("obs"), {descrption = "OBS"})
hl.bind("SUPER + A", hl.dsp.exec_cmd("omarchy-launch-webapp \"https://chatgpt.com\""), {description = "ChatGPT"})
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("omarchy-launch-webapp \"https://grok.com\""), {description = "Grok"})
o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/" })
o.bind("SUPER + U", "Toggle window floating/tiling", hl.dsp.window.float({ action = "toggle" }))
o.bind("SUPER + I", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
o.bind("SUPER + SHIFT + F", "Tiled full screen", "omarchy-hyprland-window-tiled-fullscreen-toggle")
o.bind("SUPER + D", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")
o.bind("SUPER + SHIFT + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))

-- already existed
-- hl.bind("SHIFT + mouse:272", hl.dsp.window.drag(), { mouse = true, auto_consuming = true})
-- hl.bind("SHIFT + mouse:273", hl.dsp.window.resize(), { mouse = true, auto_consuming = true})

local cursor_step = 18

local function move_cursor(dx, dy)
    local pos = hl.get_cursor_pos()
    hl.dispatch(hl.dsp.cursor.move({
        x = pos.x + dx,
        y = pos.y + dy,
    }))
end

hl.bind("SUPER + H", function()
    move_cursor(-cursor_step, 0)
end, {description = "Move cursor left", repeating = true})
hl.bind("SUPER + J", function()
    move_cursor(0, cursor_step)
end, {description = "Move cursor down", repeating = true})
hl.bind("SUPER + K", function()
    move_cursor(0, -cursor_step)
end, {description = "Move cursor up", repeating = true})
hl.bind("SUPER + L", function()
    move_cursor(cursor_step, 0)
end, {description = "Move cursor right", repeating = true})

-- local function mouse_click(button)
--     hl.dispatch(hl.dsp.send_key_state({
--         key = button,
--         state = "down",
--         mods = "SUPER"
--     }))
--     hl.dispatch(hl.dsp.send_key_state({
--         key = button,
--         state = "up",
--         mods = "SUPER"
--     }))
-- end

-- would need a new bind now that y is youtube
-- hl.bind("SUPER + Y", function()
--     mouse_click("mouse:272")
-- end, {description = "Left click"})
-- hl.bind("SUPER + SHIFT + Y", function()
--     mouse_click("mouse:273")
-- end, {description = "Right click"})

---@param offset number
---@return nil
local function zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    end
    -- current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
    hl.config({ cursor = { zoom_factor = current } })
end

hl.bind("SUPER + V", function()
    zoom(1)
end, {description = "Zoom In", auto_consuming = true})
hl.bind("SUPER + SHIFT + V", function()
    zoom(-1)
end, {description = "Zoom Out", auto_consuming = true})
o.bind("SUPER + SHIFT + Z", "Reset zoom", function()
  hl.config({ cursor = { zoom_factor = 1 } })
end)
hl.bind("SHIFT + mouse_down", function() zoom(0.3) end, {description = "Zoom In", auto_consuming = true})
hl.bind("SHIFT + mouse_up", function() zoom(-0.3) end, {description = "Zoom Out", auto_consuming = true})

o.bind("SUPER + M", "Mute", "omarchy-audio-output-volume mute-toggle", { locked = true })
-- Setting a moving wallpaper
-- exec-once = mpvpaper -o "no-audio loop" eDP-1 ~/Wallpapers/DanDaDanedited.webm
