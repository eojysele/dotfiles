local launchmenu = {
	default_prog = nil,
	launch_menu = nil,
}

local platform = require("core.utils.platform")

if platform.is_windows then
	launchmenu.default_prog = { "wsl.exe" }
	launchmenu.launch_menu = {
		{
			label = "PowerShell",
			args = { "powershell.exe", "-NoLogo" },
		},
		{
			label = "WSL (default)",
			args = { "wsl.exe" },
		},
	}
end

return launchmenu
