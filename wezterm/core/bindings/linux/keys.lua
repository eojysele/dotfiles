local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

local table_utils = require("core.utils.table")
local wl_keys = require("core.bindings.shared.wl.keys")

function K.get()
	local keys = {
		{
			key = "V",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "v", mods = "CTRL" }),
		},
		{
			key = "T",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "t", mods = "CTRL" }),
		},
		{
			key = "W",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "w", mods = "CTRL" }),
		},
		{
			key = "F",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "f", mods = "CTRL" }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "a", mods = "CTRL" }),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "e", mods = "CTRL" }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = action.SendKey({ key = "b", mods = "ALT" }),
		},
		{
			key = "RightArrow",
			mods = "CTRL",
			action = action.SendKey({ key = "f", mods = "ALT" }),
		},
		{
			key = "Backspace",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "u", mods = "CTRL" }),
		},
		{
			key = "Backspace",
			mods = "CTRL",
			action = action.SendKey({ key = "w", mods = "CTRL" }),
		},
	}
	table_utils.merge(keys, wl_keys.get())

	return keys
end

return K
