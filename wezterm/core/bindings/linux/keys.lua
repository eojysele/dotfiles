local K = {}

local actions = require("core.bindings.action.keys").get()
local table_utils = require("core.utils.table")
local wl_keys = require("core.bindings.shared.wl.keys").get()

function K.get()
	local keys = {
		{ key = "LeftArrow", mods = "CTRL", action = actions.ShellKeys.BackwardWord },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = actions.ShellKeys.BeginningOfLine },
		{ key = "RightArrow", mods = "CTRL", action = actions.ShellKeys.ForwardWord },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = actions.ShellKeys.EndOfLine },
		{ key = "Backspace", mods = "CTRL", action = actions.ShellKeys.BackwardKillWord },
		{ key = "Backspace", mods = "CTRL|SHIFT", action = actions.ShellKeys.BackwardKillLine },
		{ key = "V", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_V },
	}
	table_utils.merge(keys, wl_keys.get())

	return keys
end

return K
