local wezterm = require("wezterm")
local config = wezterm.config_builder()

local platform = require("core.utils.platform")

local font_family = "Iosevka Nerd Font Mono"
local font_size = platform.is_mac and 16 or 12.5
config.font = wezterm.font(font_family)
config.font_size = font_size
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.initial_cols = 120
config.initial_rows = 32
config.scrollback_lines = 10000
config.adjust_window_size_when_changing_font_size = false
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

local theme = require("core.theme")
config.default_cursor_style = "SteadyBlock"
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.colors = theme.get_colors()
config.force_reverse_video_cursor = false
config.window_frame = theme.get_window_frame(font_family, font_size)
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.native_macos_fullscreen_mode = true

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0cell",
	bottom = "0cell",
}

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.7,
}

config.front_end = "WebGpu"
config.webgpu_power_preference = "LowPower"

local bindings = require("core.bindings").get_defaults()
config.disable_default_key_bindings = true
config.disable_default_mouse_bindings = true
config.leader = bindings.leader
config.keys = bindings.keys
config.key_tables = bindings.key_tables
config.mouse_bindings = bindings.mouse_bindings

local launchmenu = require("core.launchmenu")
config.default_prog = launchmenu.default_prog
config.launch_menu = launchmenu.launch_menu

require("core.events").setup()

return config
