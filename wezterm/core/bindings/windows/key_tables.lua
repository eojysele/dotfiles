local KT = {}

local wezterm = require("wezterm")
local action = wezterm.action

function KT.get()
	local key_tables = {
		powershell = {
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
				key = "LeftArrow",
				mods = "ALT",
				action = action.SendKey({ key = "b", mods = "ALT" }),
			},
			{
				key = "RightArrow",
				mods = "ALT",
				action = action.SendKey({ key = "f", mods = "ALT" }),
			},
			{
				key = "Backspace",
				mods = "CTRL",
				action = action.SendKey({ key = "u", mods = "CTRL" }),
			},
			{
				key = "Backspace",
				mods = "ALT",
				action = action.SendKey({ key = "w", mods = "CTRL" }),
			},
		}
	}

	return key_tables
end

return KT
