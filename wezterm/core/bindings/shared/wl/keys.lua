local K = {}

local actions = require("core.bindings.action").get()

function K.get()
	local keys = {
		{ key = "c", mods = "CTRL", action = actions.CopyToClipboardOrSIGINT },
		{ key = "v", mods = "CTRL", action = actions.PasteFromClipboard },
		{ key = "Q", mods = "CTRL|SHIFT", action = actions.QuitApplication },
		{ key = "T", mods = "CTRL|SHIFT", action = actions.NewTab },
		{ key = "W", mods = "CTRL|SHIFT", action = actions.CloseTab },
		{ key = "N", mods = "CTRL|SHIFT", action = actions.NewWindow },
		{ key = "[", mods = "ALT", action = actions.PreviousTab },
		{ key = "]", mods = "ALT", action = actions.NewTab },
		{ key = "{", mods = "ALT|SHIFT", action = actions.MoveTabLeft },
		{ key = "}", mods = "ALT|SHIFT", action = actions.MoveTabRight },
		{ key = "a", mods = "ALT", action = actions.TmuxLeader },
		{ key = "/", mods = "ALT", action = actions.ToggleLeader },
		{ key = "=", mods = "CTRL", action = actions.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = actions.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = actions.ResetFontSize },
		{ key = "F", mods = "CTRL|SHIFT", action = actions.Search },
		{ key = "F11", mods = "", action = actions.ToggleFullScreen },
		{ key = "D", mods = "CTRL|SHIFT", action = actions.ShowDebugOverlay },
	}

	return keys
end

return K
