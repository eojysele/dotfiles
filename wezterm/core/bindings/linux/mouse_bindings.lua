local MB = {}

local table_utils = require("core.utils.table")
local wl_mouse_bindings = require("core.bindings.shared.wl.mouse_bindings")

function MB.get()
	local mouse_bindings = {}
	table_utils.merge(mouse_bindings, wl_mouse_bindings.get())

	return mouse_bindings
end

return MB
