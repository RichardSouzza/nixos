-- ################
-- ### HYPRLAND ###
-- ################

-- You can split this configuration into multiple files

-- Create your files separately and then link them to this file like this:

-- source = ~/.config/hypr/myColors.conf

-- ################
-- ### MONITORS ###
-- ################

-- See https://wiki.hyprland.org/Configuring/Monitors/

hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = 1.25,
})

hl.monitor({
    output   = "eDP-2",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- #############################
-- ### ENVIRONMENT VARIABLES ###
-- #############################

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

-- Toolkit Backend Variables

-- env = CLUTTER_BACKEND,wayland # Force Clutter applications to try and use the Wayland backend

-- env = GDK_BACKEND,wayland,x11 # GTK: Use Wayland if available; if not, try X11

hl.env("GDK_SCALE", 2)

hl.env("GDK_DPI_SCALE", 1)

-- env = GTK_THEME,Nord

-- Qt Variables

-- env = QT_AUTO_SCREEN_SCALE_FACTOR,1 # enables automatic scaling, based on the monitor’s pixel density

-- env = QT_QPA_PLATFORM,wayland;xcb # Tell Qt applications to use the Wayland backend, and fall back to X11 if Wayland is unavailable

-- env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1 # Disables window decorations on Qt applications

-- env = QT_QPA_PLATFORMTHEME,qt5ct # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.

-- env = SDL_VIDEODRIVER,wayland;x11 # Run SDL2 applications on Wayland

-- Theming Related Variables

hl.env("HYPRCURSOR_THEME", "Nordzy")

hl.env("HYPRCURSOR_SIZE", 22)

hl.env("XCURSOR_THEME", "Nordzy")

hl.env("XCURSOR_SIZE", 22)

hl.env("WLR_NO_HARDWARE_CURSORS", 1)

-- #####################
-- ### LOOK AND FEEL ###
-- #####################

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = "rgba(4c566aff)",
            inactive_border = "rgba(2e3440ff)",
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#decoration

hl.config({
    decoration = {
        rounding = 10,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            ignore_opacity = true,
            new_optimizations = true,
            noise = 0,
            passes = 3,
            size = 10,
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#animations

hl.config({
    animations = {
        enabled = true,
        -- https://wiki.hyprland.org/Configuring/Animations/ for more
    },
})
hl.curve("easeOutQuint", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})
hl.curve("easeInOutCubic", {
    type = "bezier",
    points = { { 0.65, 0.05 }, { 0.36, 1 } },
})
hl.curve("linear", {
    type = "bezier",
    points = { { 0, 0 }, { 1, 1 } },
})
hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.50, 0.5 }, { 0.75, 1 } },
})
hl.curve("quick", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.10, 1 } },
})
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/

-- "Smart gaps" / "No gaps when only"

-- uncomment all if you wish to use that.

-- workspace = w[tv1], gapsout:0, gapsin:0

-- workspace = f[1], gapsout:0, gapsin:0

-- windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]

-- windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]

-- windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]

-- windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more

hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#misc

hl.config({
    misc = {
        animate_manual_resizes = true,
        -- Fix resize window animation
        disable_hyprland_logo = false,
        -- If true disables the random hyprland logo / anime girl background. :(
        force_default_wallpaper = 0,
        -- Set to 0 or 1 to disable the anime mascot wallpapers
        focus_on_activate = true,
        -- Move focus when a window is activated
    },
})

-- https://wiki.hypr.land/Configuring/XWayland/#hidpi-xwayland

hl.config({
    xwayland = {
        force_zero_scaling = true,
        -- Fix JetBrains IDEs scaling
    },
})

-- #############
-- ### INPUT ###
-- #############

-- https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
    input = {
        kb_layout = "br",
        kb_model = "pc105",
        follow_mouse = 1,
        sensitivity = 0,
        -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures

hl.config({
    gestures = {
        workspace_swipe_touch = true,
        workspace_swipe_cancel_ratio = 0.2,
        workspace_swipe_forever = true,
    },
})
hl.gesture({
    ["fingers"] = 3,
    ["direction"] = "horizontal",
    ["action"] = "workspace",
})

-- Example per-device config

-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#cursor

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

-- ###################
-- ### KEYBINDINGS ###
-- ###################

hl.config({
    binds = {
        hide_special_on_workspace_change = true,
    },
})

-- App binds

hl.bind("SUPER + A", hl.dsp.exec_cmd("walker"))

hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty --class clipse -e clipse"))

hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus --new-window"))

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + Q", hl.dsp.window.close())

hl.bind("SUPER + V", hl.dsp.window.float())

hl.bind("SUPER + X", hl.dsp.exec_cmd("kitty"))

hl.bind("SUPER + period", hl.dsp.exec_cmd("smile"))

hl.bind("SUPER + Delete", hl.dsp.exit())

hl.bind("SUPER + Escape", hl.dsp.exec_cmd("kitty --class systemctl-tui -e systemctl-tui"))

hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -aq"))

hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grimblast --notify --freeze copy output"))

hl.bind("Print", hl.dsp.exec_cmd("grimblast --notify --freeze copy area"))

hl.bind("F11", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Move focus with SUPER + arrow keys

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))

hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))

hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- Move active window in a workspace with SUPER + SHIFT + arrow keys

hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))

hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))

hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))

hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Resize active window

hl.bind("SUPER + equal", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })

hl.bind("SUPER + minus", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })

hl.bind("SUPER + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

hl.bind("SUPER + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })

-- Switch workspaces with SUPER + [0-9]

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))

hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))

hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))

hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))

hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))

hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))

hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))

hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))

hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))

hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with SUPER + SHIFT + [0-9]

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))

hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))

hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))

hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))

hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))

hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))

hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))

hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))

hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Cycle through windows with Alt + Tab

hl.bind("ALT + Tab", hl.dsp.window.cycle_next())

-- Mange special workspace (scratchpad)

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))

hl.bind("SUPER + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("SUPER + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "previous" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Gromit keybinds

hl.bind("SUPER + Z", hl.dsp.workspace.toggle_special("gromit"))

hl.bind("SUPER + Z", hl.dsp.submap("gromit"))

hl.define_submap("gromit", function()
    hl.bind("SUPER + Z", hl.dsp.workspace.toggle_special("gromit"))
    hl.bind("SUPER + Z", hl.dsp.submap("reset"))
    hl.bind("CTRL + R", hl.dsp.exec_cmd("gromit-mpx --redo"))
    hl.bind("CTRL + Z", hl.dsp.exec_cmd("gromit-mpx --undo"))
    hl.bind("CTRL + C", hl.dsp.exec_cmd("gromit-mpx --clear"))
    hl.bind("Escape", hl.dsp.workspace.toggle_special("gromit"))
    hl.bind("Escape", hl.dsp.submap("reset"))
end)


-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && source ~/.config/hypr/notify-volume-change.sh"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && source ~/.config/hypr/notify-volume-change.sh"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && source ~/.config/hypr/notify-volume-toggle.sh"))

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && source ~/.config/hypr/notify-microphone-toggle.sh"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+ && source ~/.config/hypr/notify-brightness.sh"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%- && source ~/.config/hypr/notify-brightness.sh"))

-- Requires playerctl

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

-- Ignore maximize requests from apps. You'll probably like this.

hl.window_rule({
    name  = "supress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland

hl.window_rule({
    name  = "xwayland-drag-fix",
    match = {
        class = "^$",
        title = "^$",
        float = true,
        fullscreen = false,
        pin = false,
        xwayland = true,
    },
    no_focus = true,
})

-- Configure Clipse

hl.window_rule({
    name  = "float_true_356",
    match = {
        class = "clipse",
    },
    float = true,
})

hl.window_rule({
    name  = "move_60_560_357",
    match = {
        class = "clipse",
    },
    move = { 60, 560 },
})

hl.window_rule({
    name  = "pin_true_358",
    match = {
        class = "clipse",
    },
    pin = true,
})

hl.window_rule({
    name  = "size_440_300_359",
    match = {
        class = "clipse",
    },
    size = { 440, 300 },
})

hl.window_rule({
    name  = "stay_focused_true_360",
    match = {
        class = "clipse",
    },
    stay_focused = true,
})

hl.window_rule({
    name  = "border_size_1_361",
    match = {
        class = "clipse",
    },
    border_size = 1,
})

-- Configure Gromit

hl.workspace_rule({
    workspace = "special:gromit",
    gaps_in = 0,
    gaps_out = 0,
    decorate = false,
    no_border = true,
    on_created_empty = "gromit-mpx -a -o 0",
})

hl.window_rule({
    name  = "gromit",
    match = { class = "^(Gromit-mpx)$" },
    size = { "100%", "100%" },
    no_blur = true,
    no_anim = true,
    no_dim = true,
    no_shadow = true,
    opacity = "1 override",
    suppress_event = "fullscreen maximize",
})

-- Configure Kitty

hl.window_rule({
    match = { class = "kitty" },
    opacity = "0.8 0.8",
})

-- Configure Smile

hl.window_rule({
    match = { class = "(it.mijorus.smile)" },
    float = true,
})

hl.window_rule({
    match = { class = "(it.mijorus.smile)" },
    pin = true,
})

hl.window_rule({
    match = { class = "(it.mijorus.smile)" },
    border_size = 1,
})

-- Fix JetBrains IDEs focus

-- https://github.com/hyprwm/Hyprland/issues/2412

hl.window_rule({
    name  = "jetbrains-splash",
    match = { class = "jetbrains-.*", title = "splash", float = true },
    center = true,
    no_focus = true,
})

hl.window_rule({
    name  = "jetbrains-win-popups",
    match = { class = "jetbrains-.*", title = "win.*", float = true },
    no_focus = true,
})

hl.window_rule({
    name  = "jetbrains-floating",
    match = { class = "jetbrains-.*", float = true },
    no_blur = true,
    no_initial_focus = true,
    opacity = "1 override 1 override 1 override",
})

-- ###################
-- ### MY PROGRAMS ###
-- ###################

-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Set programs that you use

-- #################
-- ### AUTOSTART ###
-- #################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("elephant")
    hl.exec_cmd("hyprctl setcursor Nordzy-cursors 22")
    hl.exec_cmd("walker --gapplication-service")
    hl.exec_cmd("waybar")
    hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1")
    hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0")
end)
