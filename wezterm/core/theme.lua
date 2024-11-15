local T = {}

local wezterm = require("wezterm")

-- Catppuccin Frappe
local colors = {
	rosewater = "#f2d5cf",
	flamingo = "#eebebe",
	pink = "#f4b8e4",
	mauve = "#ca9ee6",
	red = "#e78284",
	maroon = "#ea999c",
	peach = "#ef9f76",
	yellow = "#e5c890",
	green = "#a6d189",
	teal = "#81c8be",
	sky = "#99d1db",
	sapphire = "#85c1dc",
	blue = "#8caaee",
	lavender = "#babbf1",
	text = "#c6d0f5",
	subtext1 = "#b5bfe2",
	subtext0 = "#a5adce",
	overlay2 = "#949cbb",
	overlay1 = "#838ba7",
	overlay0 = "#737994",
	surface2 = "#626880",
	surface1 = "#51576d",
	surface0 = "#414559",
	base = "#303446",
	mantle = "#292c3c",
	crust = "#232634",
}

function T.get_colors()
	return {
		foreground = colors.text,
		background = colors.base,
		cursor_fg = colors.base,
		cursor_bg = colors.text,
		cursor_border = colors.text,
		selection_fg = nil,
		selection_bg = colors.surface1,
		scrollbar_thumb = colors.surface2,
		split = colors.overlay0,
		ansi = {
			colors.surface1,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.pink,
			colors.teal,
			colors.subtext1,
		},
		brights = {
			colors.surface2,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.pink,
			colors.teal,
			colors.subtext0,
		},
		indexed = { [16] = colors.peach, [17] = colors.rosewater },
		tab_bar = {
			background = colors.crust,
			active_tab = {
				fg_color = colors.text,
				bg_color = colors.base,
			},
			inactive_tab = {
				fg_color = colors.subtext0,
				bg_color = colors.mantle,
			},
			inactive_tab_hover = {
				fg_color = colors.subtext0,
				bg_color = colors.base,
			},
			new_tab = {
				fg_color = colors.text,
				bg_color = colors.crust,
			},
			new_tab_hover = {
				fg_color = colors.text,
				bg_color = colors.base,
			},
			inactive_tab_edge = colors.crust,
		},
		visual_bell = colors.surface0,
	}
end

function T.get_window_frame(font_name, font_size)
	return {
		font = wezterm.font({ family = font_name, weight = "Bold" }),
		font_size = font_size,
		active_titlebar_bg = colors.crust,
		active_titlebar_fg = colors.text,
		inactive_titlebar_bg = colors.crust,
		inactive_titlebar_fg = colors.text,
		button_fg = colors.text,
		button_bg = colors.base,
	}
end

return T
