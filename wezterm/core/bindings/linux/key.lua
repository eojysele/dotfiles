local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

local table_utils = require("wezterm.core.utils.table")
local wl_keys = require("wezterm.core.bindings.shared.wl_keys")

function K.get()
	local keys = {}
	table_utils.merge(keys, wl_keys.get())

	return keys
end

return K
