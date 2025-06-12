local MB = {}

local wezterm = require("wezterm")
local action = wezterm.action

function MB.get()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CMD",
			action = action.IncreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CMD",
			action = action.DecreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CMD",
			action = action.ResetFontSize,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CMD",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}
	return mouse_bindings
end

return MB
