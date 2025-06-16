local MB = {}

local actions = require("core.bindings.action.mouse").get()

function MB.get()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = actions.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = actions.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			action = actions.ExtendSelectionToMouseCursorCell,
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			action = actions.ExtendSelectionToMouseCursorCell,
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			action = actions.ClearSelection,
			mods = "NONE",
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			action = actions.ClearSelection,
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = actions.SelectTextAtMouseCursorWord,
			mods = "NONE",
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = actions.SelectTextAtMouseCursorWord,
			mods = "SHIFT",
		},
		{
			event = { Drag = { streak = 2, button = "Left" } },
			action = actions.ExtendSelectionToMouseCursorWord,
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 2, button = "Left" } },
			action = actions.ExtendSelectionToMouseCursorWord,
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = actions.SelectTextAtMouseCursorLine,
			mods = "NONE",
		},
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = actions.SelectTextAtMouseCursorLine,
			mods = "SHIFT",
		},
		{
			event = { Drag = { streak = 3, button = "Left" } },
			action = actions.ExtendSelectionToMouseCursorLine,
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 3, button = "Left" } },
			action = actions.ExtendSelectionToMouseCursorLine,
			mods = "SHIFT",
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "SHIFT",
			action = actions.OpenLinkAtMouseCursor,
		},
	}

	return mouse_bindings
end

return MB
