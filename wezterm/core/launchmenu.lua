local launchmenu = {
	default_prog = nil,
	launch_menu = nil,
}

local wezterm = require("wezterm")
local platform = require("core.utils.platform")
local table_utils = require("core.utils.table")

local function get_wsl()
	local wsl_menu = {}

	local wsl_list = wezterm.default_wsl_domains()
	for _, wsl in ipairs(wsl_list) do
		local distribution = wsl.distribution
		local wsl_command = {
			label = "WSL: " .. distribution,
			args = {
				"wsl.exe",
				"-d",
				distribution,
				"--cd",
				"~",
			},
		}

		table.insert(wsl_menu, wsl_command)
	end

	return wsl_menu
end

if platform.is_windows then
	local default_prog = { "wsl.exe", "--cd", "~" }
	local launch_menu = {
		{
			label = "PowerShell",
			args = { "powershell.exe", "-NoLogo" },
		},
	}

	table_utils.merge(launch_menu, get_wsl())

	launchmenu.default_prog = default_prog
	launchmenu.launch_menu = launch_menu
end

return launchmenu
