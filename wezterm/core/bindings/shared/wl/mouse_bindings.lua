local MB = {}

local actions = require("core.bindings.action").get()

function MB.get()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = actions.IncreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = actions.DecreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CTRL",
			action = actions.ResetFontSize,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = actions.Mouse.OpenLinkAtMouseCursor,
		},
	}

	return mouse_bindings
end

return MB
