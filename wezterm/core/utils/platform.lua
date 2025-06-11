local platform_name = require("wezterm").target_triple

local os = {
	apple = "apple",
	linux = "linux",
	windows = "windows",
}

local function os_is_mac()
	return string.find(platform_name, os.apple) ~= nil
end

local function os_is_linux()
	return string.find(platform_name, os.linux) ~= nil
end

local function os_is_windows()
	return string.find(platform_name, os.windows) ~= nil
end

local function get_os_prefix()
	if os_is_mac() then return "macos" end
	if os_is_windows() then return "windows" end
	if os_is_linux() then return "linux" end
	return "linux"
end


local platform = {
	is_mac = os_is_mac(),
	is_linux = os_is_linux(),
	is_windows = os_is_windows(),
	os_prefix = get_os_prefix(),
	os_prefix_with_dot = get_os_prefix() .. "."
}

return platform
