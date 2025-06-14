local K = {}

local actions = require("core.bindings.action.keys").get()

function K.get()
	local keys = {
		{ key = "Q", mods = "CTRL|SHIFT", action = actions.QuitApplication },
		{ key = "c", mods = "CTRL", action = actions.CopyToClipboardOrSIGINT },
		{ key = "v", mods = "CTRL", action = actions.PasteFromClipboard },
		{ key = "t", mods = "CTRL", action = actions.NewTab },
		{ key = "w", mods = "CTRL", action = actions.CloseTab },
		{ key = "n", mods = "CTRL", action = actions.NewWindow },
		{ key = "[", mods = "ALT", action = actions.PreviousTab },
		{ key = "]", mods = "ALT", action = actions.NewTab },
		{ key = "{", mods = "ALT|SHIFT", action = actions.MoveTabLeft },
		{ key = "}", mods = "ALT|SHIFT", action = actions.MoveTabRight },
		{ key = "a", mods = "ALT", action = actions.TmuxLeader },
		{ key = "/", mods = "ALT", action = actions.ToggleLeader },
		{ key = "=", mods = "CTRL", action = actions.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = actions.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = actions.ResetFontSize },
		{ key = "f", mods = "CTRL", action = actions.Search },
		{ key = "F11", mods = "", action = actions.ToggleFullScreen },
		{ key = "D", mods = "CTRL|SHIFT", action = actions.ShowDebugOverlay },
	}

	return keys
end

return K
