local K = {}

local actions = require("core.bindings.action").get()

function K.get()
	local keys = {
		{ key = "q", mods = "CMD", action = actions.QuitApplication },
		{ key = "h", mods = "CMD", action = actions.HideApplication },
		{ key = "m", mods = "CMD", action = actions.Hide },
		{ key = "c", mods = "CMD", action = actions.CopyToClipboard },
		{ key = "v", mods = "CMD", action = actions.PasteFromClipboard },
		{ key = "t", mods = "CMD", action = actions.NewTab },
		{ key = "w", mods = "CMD", action = actions.CloseTab },
		{ key = "n", mods = "CMD", action = actions.NewWindow },
		{ key = "[", mods = "CMD", action = actions.PreviousTab },
		{ key = "]", mods = "CMD", action = actions.NextTab },
		{ key = "{", mods = "CMD|SHIFT", action = actions.MoveTabLeft },
		{ key = "}", mods = "CMD|SHIFT", action = actions.MoveTabRight },
		{ key = "a", mods = "CMD", action = actions.TmuxLeader },
		{ key = "LeftArrow", mods = "CMD", action = actions.Shell.BeginningOfLine },
		{ key = "RightArrow", mods = "CMD", action = actions.Shell.EndOfLine },
		{ key = "LeftArrow", mods = "OPT", action = actions.Shell.BackwardWord },
		{ key = "RightArrow", mods = "OPT", action = actions.Shell.ForwardWord },
		{ key = "Backspace", mods = "CMD", action = actions.Shell.BackwardKillLine },
		{ key = "Backspace", mods = "OPT", action = actions.Shell.BackwardKillWord },
		{ key = "/", mods = "CMD", action = actions({ EmitEvent = "toggle-leader" }) },
		{ key = "+", mods = "CMD", action = actions.IncreaseFontSize },
		{ key = "-", mods = "CMD", action = actions.DecreaseFontSize },
		{ key = "0", mods = "CMD", action = actions.ResetFontSize },
		{ key = "f", mods = "CMD", action = actions.Search },
		{ key = "f", mods = "CMD|CTRL", action = actions.ToggleFullScreen },
		{ key = "D", mods = "CMD|SHIFT", action = actions.ShowDebugOverlay },
	}

	return keys
end

return K
