local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("core.events").setup(wezterm)

local os_utils = require("core.utils.os")

local font_name = "IosevkaTerm Nerd Font Mono"
local font_size = 16

if os_utils.is_mac_os == false then
	font_size = 12.5
end

config.font = wezterm.font(font_name)
config.font_size = font_size

local theme = require("core.theme")
config.colors = theme.get_colors()
config.window_frame = theme.get_window_frame(font_name, font_size)

config.scrollback_lines = 10000
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = false
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

local bindings = require("core.bindings")
config.leader = bindings.setup_leader()
config.keys = bindings.setup_keyboard_bindings()
config.key_tables = bindings.setup_key_tables()
config.mouse_bindings = bindings.setup_mouse_bindigns()

return config
