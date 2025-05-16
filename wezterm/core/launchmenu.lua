local launchmenu = {
	default_prog = nil,
	launch_menu = nil,
}

local platform = require("core.utils.platform")

if platform.is_windows then
	local wsl_default_args = { "wsl.exe", "--cd", "~" }
	launchmenu.default_prog = wsl_default_args
	launchmenu.launch_menu = {
		{
			label = "PowerShell",
			args = { "powershell.exe", "-NoLogo" },
		},
		{
			label = "WSL (default)",
			args = wsl_default_args,
		},
	}
end

return launchmenu
