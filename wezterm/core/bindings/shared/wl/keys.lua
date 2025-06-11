local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

function K.get()
	local keys = {
		{ key = "Q", mods = "CTRL|SHIFT", action = action.QuitApplication },
		{
			key = "c",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				local selection_text = window:get_selection_text_for_pane(pane)
				local is_selection_active = string.len(selection_text) ~= 0
				if is_selection_active then
					window:perform_action(
						action.Multiple({
							action.CopyTo("ClipboardAndPrimarySelection"),
							action.ClearSelection,
						}),
						pane
					)
				else
					window:perform_action(
						action.Multiple({
							action.SendKey({ key = "c", mods = "CTRL" }),
							action.ScrollToBottom,
						}),
						pane
					)
				end
			end),
		},
		{ key = "v", mods = "CTRL", action = action.PasteFrom("Clipboard") },
		{
			key = "V",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "v", mods = "CTRL" }),
		},
		{ key = "t", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain") },
		{
			key = "T",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "t", mods = "CTRL" }),
		},
		{
			key = "w",
			mods = "CTRL",
			action = action.CloseCurrentTab({ confirm = false }),
		},
		{
			key = "W",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "w", mods = "CTRL" }),
		},
		{ key = "n", mods = "CTRL", action = action.SpawnWindow },
		{ key = "[", mods = "ALT", action = action.ActivateTabRelative(-1) },
		{ key = "]", mods = "ALT", action = action.ActivateTabRelative(1) },
		{ key = "{", mods = "ALT|SHIFT", action = action.MoveTabRelative(-1) },
		{ key = "}", mods = "ALT|SHIFT", action = action.MoveTabRelative(1) },
		{
			key = "a",
			mods = "ALT",
			action = action.SendKey({ key = "b", mods = "CTRL" }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = action.SendKey({ key = "a", mods = "CTRL" }),
		},
		{
			key = "RightArrow",
			mods = "CTRL",
			action = action.SendKey({ key = "e", mods = "CTRL" }),
		},
		{
			key = "LeftArrow",
			mods = "ALT",
			action = action.SendKey({ key = "b", mods = "ALT" }),
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = action.SendKey({ key = "f", mods = "ALT" }),
		},
		{
			key = "Backspace",
			mods = "CTRL",
			action = action.SendKey({ key = "u", mods = "CTRL" }),
		},
		{
			key = "Backspace",
			mods = "ALT",
			action = action.SendKey({ key = "w", mods = "CTRL" }),
		},
		{
			key = "/",
			mods = "ALT",
			action = action({ EmitEvent = "toggle-leader" }),
		},
		{ key = "=", mods = "CTRL", action = action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = action.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = action.ResetFontSize },
		{
			key = "f",
			mods = "CTRL",
			action = action.Search("CurrentSelectionOrEmptyString"),
		},
		{
			key = "F",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "f", mods = "CTRL" }),
		},
		{ key = "F11", mods = "", action = action.ToggleFullScreen },
		{ key = "D", mods = "CTRL|SHIFT", action = action.ShowDebugOverlay },
	}

	for i = 1, 9 do
		local key = { key = tostring(i), mods = "ALT", action = action.ActivateTab(i - 1) }
		table.insert(keys, key)
	end

	return keys
end

return K
