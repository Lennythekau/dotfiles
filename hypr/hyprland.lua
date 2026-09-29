------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "1920x1080@60.03",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin"
local terminalFileManager = "yazi"
local menu = "rofi -show drun"
local browser = "firefox"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	-- For screensharing, see https://gist.github.com/brunoanc/2dea6ddf6974ba4e5d26c3139ffb7580#editing-the-configuration-file
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")

	hl.exec_cmd("kwalletd6 & /usr/lib/pam_kwallet_init & waybar")

	-- System tray applets: network manager and bluetooth
	hl.exec_cmd("nm-applet & blueman-applet")
	hl.exec_cmd("hyprpaper")

	-- Run the time slice app
	hl.exec_cmd("~/code/slice/venv/bin/python ~/code/slice/main.py")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- See https://wiki.hypr.land/Nvidia/
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("HYPRSHOT_DIR", "/home/ken/Screenshots/")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 4,

		col = {
			active_border = { colors = { "rgba(92b6f0ff)", "rgba(f0eb9299)" }, angle = 45 },
			inactive_border = "rgba(393939ff)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "#1a1a1aee",
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
-- hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
-- hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
-- hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
-- hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
--
-- -- Default springs
-- hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
--
-- hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
-- hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		middle_click_paste = false,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "gb",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
		repeat_rate = 35,
		repeat_delay = 300,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local altMod = mainMod .. "+ ALT"
local shiftMod = mainMod .. "+ SHIFT "
local altShiftMod = mainMod .. "+ SHIFT + ALT"
local ctrlMod = mainMod .. "+ CTRL"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty " .. terminalFileManager))
hl.bind(shiftMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(shiftMod .. " + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(shiftMod .. " + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(shiftMod .. " + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(shiftMod .. " + j", hl.dsp.window.move({ direction = "down" }))

-- Move active window
hl.bind(
	altShiftMod .. " + h",
	hl.dsp.window.move({ x = -5, y = 0, relative = true, window = "activewindow" }),
	{ repeating = true }
)
hl.bind(
	altShiftMod .. " + l",
	hl.dsp.window.move({ x = 5, y = 0, relative = true, window = "activewindow" }),
	{ repeating = true }
)
hl.bind(
	altShiftMod .. " + k",
	hl.dsp.window.move({ x = 0, y = -5, relative = true, window = "activewindow" }),
	{ repeating = true }
)
hl.bind(
	altShiftMod .. " + j",
	hl.dsp.window.move({ x = 0, y = 5, relative = true, window = "activewindow" }),
	{ repeating = true }
)

-- resize active window
hl.bind(
	ctrlMod .. " + h",
	hl.dsp.window.resize({ x = "-5", y = 0, relative = true, window = "activewindow" }),
	{ repeating = true }
)
hl.bind(
	ctrlMod .. " + l",
	hl.dsp.window.resize({ x = "+5", y = 0, relative = true, window = "activewindow" }),
	{ repeating = true }
)
hl.bind(
	ctrlMod .. " + k",
	hl.dsp.window.resize({ x = 0, y = "-5", relative = true, window = "activewindow" }),
	{ repeating = true }
)
hl.bind(
	ctrlMod .. " + j",
	hl.dsp.window.resize({ x = 0, y = "+5", relative = true, window = "activewindow" }),
	{ repeating = true }
)

-- Pin
hl.bind(ctrlMod .. " + P", hl.dsp.window.pin())

-- Fullscreen
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen())

-- Switch focus to something else (for escaping tiled window focus)
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(shiftMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind(ctrlMod .. " + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Other app keybinds

-- browser
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(shiftMod .. " + W", hl.dsp.exec_cmd(browser .. " --private-window"))

-- hyprshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

-- hyprlock
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprlock"))

-- reload waybar
hl.bind(shiftMod .. " + C", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- rofimoji
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("rofimoji"))

-- hyprpicker
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("hyprpicker"))

-- blender
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("prime-run /opt/blender/blender"))

-- godot
hl.bind(shiftMod .. " + G", hl.dsp.exec_cmd("prime-run godot-mono"))

-- ibus
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("ibus start --type wayland"))
hl.bind(shiftMod .. " + I", hl.dsp.exec_cmd("ibus exit"))

-- normcap
hl.bind(shiftMod .. " + Q", hl.dsp.exec_cmd("normcap"))

-- slice app
hl.bind(ctrlMod .. " + S", hl.dsp.exec_cmd("~/code/slice/venv/bin/python ~/code/slice/main.py"))

-- musescore
hl.bind(mainMod .. " + numbersign", hl.dsp.exec_cmd("~/mu/mscore"))

-- dunst, getting out of my face 😠
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("dunstctl close"))

-- OBS global hotkeys (need to test these)
hl.bind(mainMod .. " + F1", hl.dsp.pass({ window = "class:com.obsproject.Studio" }))
hl.bind(mainMod .. " + F2", hl.dsp.pass({ window = "class:com.obsproject.Studio" }))
hl.bind(mainMod .. " + F3", hl.dsp.pass({ window = "class:com.obsproject.Studio" }))
hl.bind(mainMod .. " + 1", hl.dsp.pass({ window = "class:com.obsproject.Studio" }))
hl.bind(mainMod .. " + 2", hl.dsp.pass({ window = "class:com.obsproject.Studio" }))

-- Enable/disable touchpad
-- XXX: doesn't currently work
--
-- hl.bind(
-- 	ctrlMod .. " + backslash",
-- 	hl.dsp.exec_cmd(
-- 		'hyprctl keyword "device[$(hyprctl devices | grep touchpad | awk \'{$1=$1;print}\')]:enabled" "true"'
-- 	)
-- )
-- hl.bind(
-- 	ctrlMod .. " + SHIFT + backslash",
-- 	hl.dsp.exec_cmd(
-- 		'hyprctl keyword "device[$(hyprctl devices | grep touchpad | awk \'{$1=$1;print}\')]:enabled" "false'
-- 	)
-- )

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "float-ibus-IME",
	match = {
		title = "ibus.*gtk.*",
	},
	float = true,
})

hl.window_rule({
	name = "float-blueman-manager-in-bottom-right-corner",
	match = {
		class = "blueman-manager",
	},
	float = true,
	size = { "500", "300" },
	move = { "monitor_w - window_w", "monitor_h - window_h" },
})

hl.window_rule({
	name = "float-and-pin-slice-app-main-window",
	match = {
		class = "com.ken.slice",
		title = "Slice ⏰🍕",
	},
	float = true,
	pin = true,
})

hl.window_rule({
	name = "float-and-centre-slice-app-dialog",
	match = {
		class = "com.ken.slice",
		title = "negative:Slice ⏰🍕",
	},
	float = true,
	pin = true,
	move = { "(monitor_w-window_w)/2", "(monitor_h-window_h)/2" },
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
