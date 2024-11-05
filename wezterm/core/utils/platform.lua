local platform_name = require("wezterm").target_triple

local os = {
	apple = "apple",
	linux = "linux",
	windows = "windows",
}

local platform = {
	is_mac = string.find(platform_name, os.apple) ~= nil and true or false,
	is_linux = string.find(platform_name, os.linux) ~= nil and true or false,
	is_windows = string.find(platform_name, os.windows) ~= nil and true or false,
}

return platform
