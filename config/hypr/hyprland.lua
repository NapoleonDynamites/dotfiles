---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "alacritty"
local file_manager = "alacritty -e yazi"
local app_menu = "TERMINAL=wezterm fuzzel --list-executables-in-path"
local system_menu = "/home/iar/dotfiles/bin/waybar/system_menu"
local main_mod = "SUPER"

------------------
---- MONITORS ----
------------------
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_THEME", "rose-pine-hyprcursor")

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo = false,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- Main Control
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(main_mod .. " + SHIFT + N", hl.dsp.window.move({ workspace = "empty" }))
-- hl.bind(main_mod .. " + M", hl.dsp.exit())
-- hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Group Control
hl.bind(main_mod .. " + G", hl.dsp.group.toggle())
hl.bind(main_mod .. " + TAB", hl.dsp.group.next())

-- Special keys
hl.bind(main_mod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + A", hl.dsp.exec_cmd(app_menu))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd(system_menu))
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + P", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))

hl.bind(main_mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(main_mod .. " + SHIFT + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + SHIFT + left", hl.dsp.focus({ workspace = "e-1" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(main_mod .. " + K", hl.dsp.exec_cmd("env GDK_BACKEND=x11 kicad"))
hl.bind(main_mod .. " + K", hl.dsp.focus({ workspace = 9 }))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.workspace_rule({
    workspace = "9",
    default_name = "kicad",
})

hl.window_rule({
    name = "steam-fullscreen",
    match = { class = "^steam_app_.+$" },
    tile = true,
    fullscreen = true,
})

hl.window_rule({
    name = "kicad-workspace",
    match = { class = "^(KiCad|pcbnew|eeschema)$" },
    workspace = "9 silent",
    group = "set",
})
