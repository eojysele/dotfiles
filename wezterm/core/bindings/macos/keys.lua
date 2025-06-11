local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

function K.get()
	local keys = {
		{ key = "q", mods = "CMD", action = action.QuitApplication },
		{ key = "h", mods = "CMD", action = action.HideApplication },
		{ key = "m", mods = "CMD", action = action.Hide },
		{ key = "c", mods = "CMD", action = action.CopyTo("Clipboard") },
		{ key = "v", mods = "CMD", action = action.PasteFrom("Clipboard") },
		{ key = "t", mods = "CMD", action = action.SpawnTab("CurrentPaneDomain") },
		{
			key = "w",
			mods = "CMD",
			action = action.CloseCurrentTab({ confirm = false }),
		},
		{ key = "n", mods = "CMD", action = action.SpawnWindow },
		{ key = "[", mods = "CMD", action = action.ActivateTabRelative(-1) },
		{ key = "]", mods = "CMD", action = action.ActivateTabRelative(1) },
		{ key = "{", mods = "CMD|SHIFT", action = action.MoveTabRelative(-1) },
		{ key = "}", mods = "CMD|SHIFT", action = action.MoveTabRelative(1) },
		{
			key = "a",
			mods = "CMD",
			action = action.SendKey({ key = "b", mods = "CTRL" }),
		},
		{
			key = "LeftArrow",
			mods = "CMD",
			action = action.SendKey({ key = "a", mods = "CTRL" }),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = action.SendKey({ key = "e", mods = "CTRL" }),
		},
		{
			key = "LeftArrow",
			mods = "OPT",
			action = action.SendKey({ key = "b", mods = "ALT" }),
		},
		{
			key = "RightArrow",
			mods = "OPT",
			action = action.SendKey({ key = "f", mods = "ALT" }),
		},
		{
			key = "Backspace",
			mods = "CMD",
			action = action.SendKey({ key = "u", mods = "CTRL" }),
		},
		{
			key = "Backspace",
			mods = "OPT",
			action = action.SendKey({ key = "w", mods = "CTRL" }),
		},
		{ key = "/", mods = "CMD", action = action({ EmitEvent = "toggle-leader" }) },
		{ key = "+", mods = "CMD", action = action.IncreaseFontSize },
		{ key = "-", mods = "CMD", action = action.DecreaseFontSize },
		{ key = "0", mods = "CMD", action = action.ResetFontSize },
		{
			key = "f",
			mods = "CMD",
			action = action.Search("CurrentSelectionOrEmptyString"),
		},
		{ key = "f", mods = "CMD|CTRL", action = action.ToggleFullScreen },
		{ key = "D", mods = "CMD|SHIFT", action = action.ShowDebugOverlay },
	}

	for i = 1, 9 do
		local key = { key = tostring(i), mods = "CMD", action = action.ActivateTab(i - 1) }
		table.insert(keys, key)
	end

	return keys
end

return K
