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
		{ key = "t", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain") },
		{
			key = "w",
			mods = "CTRL",
			action = action.CloseCurrentTab({ confirm = false }),
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
