local K = {}

local table_utils = require("core.utils.table")
local actions = require("core.bindings.action").get()
local wl_keys = require("core.bindings.shared.wl.keys")

function K.get()
	local keys = {
		{ key = "t", mods = "ALT", action = actions.LaunchMenu },
		{ key = "LeftArrow", mods = "CTRL", action = actions.PowerShell.BackwardWord },
		{ key = "RightArrow", mods = "CTRL", action = actions.PowerShell.ForwardWord },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = actions.PowerShell.BeginningOfLine },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = actions.PowerShell.EndOfLine },
		{ key = "Backspace", mods = "CTRL", action = actions.PowerShell.BackwardKillWord },
		{
			key = "Backspace",
			mods = "CTRL|SHIFT",
			action = actions.PowerShell.BackwardKillLine,
		},
	}
	table_utils.safe_merge(keys, wl_keys.get())

	return keys
end

return K
