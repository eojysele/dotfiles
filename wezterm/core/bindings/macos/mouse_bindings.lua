local MB = {}

local wezterm = require("wezterm")
local actions = require("core.bindings.action").get()

function MB.get()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CMD",
			action = actions.IncreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CMD",
			action = actions.DecreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CMD",
			action = actions.ResetFontSize,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CMD",
			action = actions.Mouse.OpenLinkAtMouseCursor,
		},
	}
	return mouse_bindings
end

return MB
