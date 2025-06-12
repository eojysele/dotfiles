local SC = {}

local wezterm = require("wezterm")

local function safe_call(method)
	local status, result = pcall(method)
	if not status then
		wezterm.log_error(result)
		return nil
	end

	return result
end

local function object_safe_call(object, method_name)
	if type(object) ~= "table" then
		return nil
	end

	local method = object[method_name]
	if type(method) ~= "function" then
		return nil
	end

	local status, result = pcall(method, object)
	if not status then
		wezterm.log_error(result)
		return nil
	end

	return result
end

function SC.call(method)
	return safe_call(method)
end

function SC.require(modname)
	return safe_call(function()
		return require(modname)
	end)
end

function SC.object_call(object, method_name)
	return object_safe_call(object, method_name)
end

return SC
