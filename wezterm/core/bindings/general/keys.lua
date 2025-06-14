local K = {}

local actions = require("core.bindings.action.keys").get()
local platform = require("core.utils.platform")

function K.get()
	local keys = {
		{ key = "d", mods = "LEADER", action = actions.SplitHorizontal },
		{ key = "D", mods = "LEADER|SHIFT", action = actions.SplitVertical },
		{ key = "w", mods = "LEADER", action = actions.CloseCurrentPane },
		{ key = "f", mods = "LEADER", action = actions.TogglePaneZoomState },
		{ key = "h", mods = "LEADER", action = actions.ActivatePaneDirectionLeft },
		{ key = "j", mods = "LEADER", action = actions.ActivatePaneDirectionDown },
		{ key = "k", mods = "LEADER", action = actions.ActivatePaneDirectionUp },
		{ key = "l", mods = "LEADER", action = actions.ActivatePaneDirectionRight },
		{ key = "r", mods = "LEADER", action = actions.ActivateResizePane },
		{ key = "s", mods = "LEADER", action = actions.PaneSelect },
		{ key = "S", mods = "LEADER|SHIFT", action = actions.PaneSelectAndSwapWithActive },
		{ key = "v", mods = "LEADER", action = actions.ActivateCopyMode },
		{ key = "l", mods = "CTRL", action = actions.ClearViewPort },
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = actions.Multiple({
				actions.ClearViewPort,
				actions.ClearScrollbackOnly,
			}),
		},
		{ key = "Tab", mods = "CTRL", action = actions.NextTab },
		{ key = "Tab", mods = "SHIFT|CTRL", action = actions.PreviousTab },
		{ key = "Home", mods = "CTRL", action = actions.ScrollToTop },
		{ key = "End", mods = "CTRL", action = actions.ScrollToBottom },
		{ key = "PageUp", mods = "NONE", action = actions.ScrollPageUp },
		{ key = "PageDown", mods = "NONE", action = actions.ScrollPageDown },
	}

	for i = 1, 9 do
		local mods = platform.is_mac and "CMD" or "ALT"
		local key = { key = tostring(i), mods = mods, action = actions.ActivateTab(i) }
		table.insert(keys, key)
	end

	return keys
end

return K
