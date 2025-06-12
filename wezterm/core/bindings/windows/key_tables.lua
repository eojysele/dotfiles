local KT = {}

local wezterm = require("wezterm")
local action = wezterm.action

function KT.get()
	local key_tables = {
		powershell = {
			{
				key = "LeftArrow",
				mods = "CTRL|SHIFT",
				action = action.SendKey({ key = "LeftArrow", mods = "CTRL|SHIFT" }),
			},
			{
				key = "RightArrow",
				mods = "CTRL|SHIFT",
				action = action.SendKey({ key = "RightArrow", mods = "CTRL|SHIFT" }),
			},
			{
				key = "LeftArrow",
				mods = "CTRL",
				action = action.SendKey({ key = "LeftArrow", mods = "CTRL" }),
			},
			{
				key = "RightArrow",
				mods = "CTRL",
				action = action.SendKey({ key = "RightArrow", mods = "CTRL" }),
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
		},
	}

	return key_tables
end

return KT
