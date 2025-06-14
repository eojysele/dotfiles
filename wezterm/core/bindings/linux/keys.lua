local K = {}

local actions = require("core.bindings.action.keys").get()
local table_utils = require("core.utils.table")
local wl_keys = require("core.bindings.shared.wl.keys").get()

function K.get()
	local keys = {
		{ key = "LeftArrow", mods = "CTRL", action = actions.SendKey.Alt_B },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_A },
		{ key = "RightArrow", mods = "CTRL", action = actions.SendKey.Alt_F },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_E },
		{ key = "Backspace", mods = "CTRL", action = actions.SendKey.Ctrl_W },
		{ key = "Backspace", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_U },
		{ key = "V", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_V },
		{ key = "T", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_T },
		{ key = "W", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_W },
		{ key = "F", mods = "CTRL|SHIFT", action = actions.SendKey.Ctrl_F },
	}
	table_utils.merge(keys, wl_keys.get())

	return keys
end

return K
