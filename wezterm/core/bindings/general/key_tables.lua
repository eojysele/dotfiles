local KT = {}

local actions = require("core.bindings.action").get()

function KT.get()
	local key_tables = {
		resize_pane = {
			{ key = "h", action = actions.AdjustPaneSizeLeft },
			{ key = "j", action = actions.AdjustPaneSizeDown },
			{ key = "k", action = actions.AdjustPaneSizeUp },
			{ key = "l", action = actions.AdjustPaneSizeRight },
			{ key = "Escape", action = "PopKeyTable" },
		},
		select_pane = {
			{ key = "h", action = actions.ActivatePaneDirectionLeft },
			{ key = "j", action = actions.ActivatePaneDirectionDown },
			{ key = "k", action = actions.ActivatePaneDirectionUp },
			{ key = "l", action = actions.ActivatePaneDirectionRight },
			{ key = "Escape", action = "PopKeyTable" },
		},
	}

	return key_tables
end

return KT
