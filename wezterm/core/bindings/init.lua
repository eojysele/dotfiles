local B = {}

local platform = require("core.utils.platform")
local table_utils = require("core.utils.table")
local safe_call = require("core.utils.safe_call")

local function setup_binding(binding_name)
	local base_package = "core.bindings."
	local bindings = {}

	local general_bindings = safe_call.require(base_package .. "general." .. binding_name)
	table_utils.merge(bindings, safe_call.object_call(general_bindings, "get"))

	local os_specific_bindings =
		safe_call.require(base_package .. platform.os_prefix_with_dot .. binding_name)
	table_utils.safe_merge(bindings, safe_call.object_call(os_specific_bindings, "get"))

	return bindings
end

local function setup_leader()
	local leader = {
		key = "a",
		mods = platform.is_mac and "CMD" or "ALT",
		timeout_milliseconds = 1000,
	}

	return leader
end

local function setup_keys()
	return setup_binding("keys")
end

local function setup_key_tables()
	return setup_binding("key_tables")
end

local function setup_mouse_bindings()
	return setup_binding("mouse_bindings")
end

function B.get_defaults()
	return {
		leader = nil,
		keys = setup_keys(),
		key_tables = setup_key_tables(),
		mouse_bindings = setup_mouse_bindings(),
	}
end

function B.get_overrides()
	return {
		leader = setup_leader(),
		keys = nil,
		key_tables = nil,
		mouse_bindings = nil,
	}
end

return B
