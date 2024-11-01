local wezterm = require("wezterm")
local config = wezterm.config_builder()
require("core.events").setup(wezterm)

config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 16

config.scrollback_lines = 10000
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

local theme = require("core.theme")
config.colors = theme.get_colors()
config.window_frame = theme.get_window_frame()

local bindings = require("core.bindings")
config.leader = bindings.setup_leader(wezterm)
config.keys = bindings.setup_keyboard_bindings(wezterm)
config.mouse_bindings = bindings.setup_mouse_bindigns(wezterm)

return config
