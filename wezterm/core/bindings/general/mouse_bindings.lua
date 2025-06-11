local MB = {}

local wezterm = require("wezterm")
local action = wezterm.action

function MB.get()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = action.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = action.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Cell"),
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Cell"),
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			action = action.ClearSelection,
			mods = "NONE",
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			action = action.ClearSelection,
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Word"),
			mods = "NONE",
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Word"),
			mods = "SHIFT",
		},
		{
			event = { Drag = { streak = 2, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Word"),
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 2, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Word"),
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Line"),
			mods = "NONE",
		},
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Line"),
			mods = "SHIFT",
		},
		{
			event = { Drag = { streak = 3, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Line"),
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 3, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Line"),
			mods = "SHIFT",
		},
	}

	return mouse_bindings
end

return MB
