local B = {}

local platform = require("core.utils.platform")
local table_utils = require("core.utils.table")

local function safe_object_require(modname)
	local ok, result = pcall(require, modname)
	if ok then
		return result
	else
		return {}
	end
end

local function get_os_prefix()
	if platform.is_mac then return "macos" end
	if platform.is_windows then return "windows" end
	if platform.is_linux then return "linux" end
	return "unknown"
end

local function setup_binding(binding_name)
	local bindings = require("core.bindings.general." .. binding_name)
	local os_specific_bindings = safe_object_require("core.bindings." .. get_os_prefix() .. binding_name)
	table_utils.merge(bindings, os_specific_bindings)

	return bindings
end

local function setup_leader()
	local leader = {
		key = "a",
		mods = platform.is_mac and "CMD" or "ALT",
		timeout_milliseconds = 1000
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
		mouse_bindings =
		setup_mouse_bindings(),
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
