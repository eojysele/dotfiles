local wezterm = require("wezterm")
local config = wezterm.config_builder()

local platform = require("core.utils.platform")

local font_name = "IosevkaTerm Nerd Font Mono"
local font_size = 12.5
if platform.is_mac then
	font_size = 16
end

config.font = wezterm.font(font_name)
config.font_size = font_size

config.initial_cols = 120
config.initial_rows = 32
config.scrollback_lines = 10000
config.adjust_window_size_when_changing_font_size = false

local theme = require("core.theme")
config.default_cursor_style = "SteadyBar"
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.colors = theme.get_colors()
config.window_frame = theme.get_window_frame(font_name, font_size)
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = false
config.native_macos_fullscreen_mode = true

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.8,
}

local bindings = require("core.bindings")
config.disable_default_key_bindings = true
config.disable_default_mouse_bindings = true
config.leader = bindings.leader
config.keys = bindings.keys
config.key_tables = bindings.key_tables
config.mouse_bindings = bindings.mouse_bindings

require("core.events").setup()

return config
