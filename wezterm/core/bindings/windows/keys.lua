local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

local table_utils = require("core.utils.table")
local wl_keys = require("core.bindings.shared.wl.keys")

function K.get()
	local keys = {
		{
			key = "t",
			mods = "ALT",
			action = action.ShowLauncherArgs({
				flags = "LAUNCH_MENU_ITEMS",
			}),
		},
	}
	table_utils.safe_merge(keys, wl_keys.get())

	return keys
end

return K
