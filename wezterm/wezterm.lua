local wezterm = require("wezterm")
local config = wezterm.config_builder()

local font = require("core.font")
config.font = wezterm.font(font.family)
config.font_size = font.size
config.harfbuzz_features = font.harfbuzz_features

config.initial_cols = 120
config.initial_rows = 32
config.scrollback_lines = 10000
config.adjust_window_size_when_changing_font_size = false
config.automatically_reload_config = true

local theme = require("core.theme")
config.default_cursor_style = "SteadyBlock"
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.colors = theme.get_colors()
config.force_reverse_video_cursor = false
config.window_frame = theme.get_window_frame(font.family, font.size)
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = false
config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.native_macos_fullscreen_mode = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_close_confirmation = "AlwaysPrompt"

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

local gpu = require("core.gpu")
config.front_end = gpu.front_end
config.max_fps = gpu.max_fps

local bindings = require("core.bindings").get_defaults()
config.disable_default_key_bindings = true
config.disable_default_mouse_bindings = true
config.leader = bindings.leader
config.keys = bindings.keys
config.key_tables = bindings.key_tables
config.mouse_bindings = bindings.mouse_bindings
config.key_map_preference = "Physical"
config.use_ime = true

local launchmenu = require("core.launchmenu")
config.default_prog = launchmenu.default_prog
config.launch_menu = launchmenu.launch_menu
config.mux_enable_ssh_agent = false

require("core.events").setup()

return config
