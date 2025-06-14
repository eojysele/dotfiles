local SK = {}

local wezterm = require("wezterm")
local action = wezterm.action

function SK.get()
	return {
		Home = action.SendKey({ key = "Home", mods = "NONE" }),
		End = action.SendKey({ key = "End", mods = "NONE" }),
		Ctrl_A = action.SendKey({ key = "a", mods = "CTRL" }),
		Ctrl_E = action.SendKey({ key = "e", mods = "CTRL" }),
		Ctrl_F = action.SendKey({ key = "f", mods = "CTRL" }),
		Ctrl_T = action.SendKey({ key = "t", mods = "CTRL" }),
		Ctrl_U = action.SendKey({ key = "u", mods = "CTRL" }),
		Ctrl_V = action.SendKey({ key = "v", mods = "CTRL" }),
		Ctrl_W = action.SendKey({ key = "w", mods = "CTRL" }),
		Ctrl_LeftArrow = action.SendKey({ key = "LeftArrow", mods = "CTRL" }),
		Ctrl_RightArrow = action.SendKey({ key = "RightArrow", mods = "CTRL" }),
		Ctrl_Backspace = action.SendKey({ key = "Backspace", mods = "CTRL" }),
		Alt_B = action.SendKey({ key = "b", mods = "ALT" }),
		Alt_F = action.SendKey({ key = "f", mods = "ALT" }),
	}
end

return SK
