local wezterm = require("wezterm")
local action = wezterm.action

local platform = require("core.utils.platform")
local table_utils = require("core.utils.table")

local function setup_leader()
	local leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }

	if platform.is_mac then
		leader.mods = "CMD"
	end

	return leader
end

local function setup_general_keys()
	local keys = {
		{
			key = "d",
			mods = "LEADER",
			action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "LEADER",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{ key = "w", mods = "LEADER", action = action.CloseCurrentPane({ confirm = true }) },
		{ key = "f", mods = "LEADER", action = action.TogglePaneZoomState },
		{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
		{ key = "v", mods = "LEADER", action = action.ActivateCopyMode },
		{
			key = "r",
			mods = "LEADER",
			action = action.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			}),
		},
		{ key = "s", mods = "LEADER", action = action.PaneSelect({ alphabet = "1234567890" }) },
		{
			key = "S",
			mods = "LEADER",
			action = action.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActive" }),
		},
		{
			key = "l",
			mods = "CTRL",
			action = action.SendKey({ key = "l", mods = "CTRL" }),
		},
		{
			key = "L",
			mods = "CTRL|SHIFT",
			action = action.Multiple({
				action.SendKey({ key = "l", mods = "CTRL" }),
				action.ClearScrollback("ScrollbackOnly"),
			}),
		},
		{ key = "Tab", mods = "CTRL", action = action.ActivateTabRelative(1) },
		{ key = "Tab", mods = "SHIFT|CTRL", action = action.ActivateTabRelative(-1) },
		{ key = "Home", mods = "", action = action.ScrollToTop },
		{ key = "End", mods = "", action = action.ScrollToBottom },
		{ key = "PageUp", mods = "", action = action.ScrollByPage(-0.5) },
		{ key = "PageDown", mods = "", action = action.ScrollByPage(0.5) },
	}

	return keys
end

local function setup_mac_os_keys()
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
			action = action.CloseCurrentTab({ confirm = true }),
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

local function setup_other_os_keys()
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
			action = action.CloseCurrentTab({ confirm = true }),
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

local function setup_keys()
	local keys = setup_general_keys()

	local os_specific_keys = {}
	if platform.is_mac then
		os_specific_keys = setup_mac_os_keys()
	else
		os_specific_keys = setup_other_os_keys()
	end

	table_utils.merge(keys, os_specific_keys)

	return keys
end

local function setup_key_tables()
	local key_tables = {
		search_mode = {
			{ key = "Enter", mods = "NONE", action = action.CopyMode("PriorMatch") },
			{ key = "Escape", mods = "NONE", action = action.CopyMode("Close") },
			{ key = "n", mods = "CTRL", action = action.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = action.CopyMode("PriorMatch") },
			{ key = "r", mods = "CTRL", action = action.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = action.CopyMode("ClearPattern") },
			{ key = "PageUp", mods = "NONE", action = action.CopyMode("PriorMatchPage") },
			{ key = "PageDown", mods = "NONE", action = action.CopyMode("NextMatchPage") },
			{ key = "UpArrow", mods = "NONE", action = action.CopyMode("PriorMatch") },
			{ key = "DownArrow", mods = "NONE", action = action.CopyMode("NextMatch") },
		},
		resize_pane = {
			{ key = "h", action = action.AdjustPaneSize({ "Left", 5 }) },
			{ key = "j", action = action.AdjustPaneSize({ "Down", 5 }) },
			{ key = "k", action = action.AdjustPaneSize({ "Up", 5 }) },
			{ key = "l", action = action.AdjustPaneSize({ "Right", 5 }) },
			{ key = "Escape", action = "PopKeyTable" },
		},
		copy_mode = {
			{ key = "Tab", mods = "NONE", action = action.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "SHIFT", action = action.CopyMode("MoveBackwardWord") },
			{
				key = "Enter",
				mods = "NONE",
				action = action.CopyMode("MoveToStartOfNextLine"),
			},
			{ key = "Escape", mods = "NONE", action = action.CopyMode("Close") },
			{
				key = "Space",
				mods = "NONE",
				action = action.CopyMode({ SetSelectionMode = "Cell" }),
			},
			{
				key = "$",
				mods = "NONE",
				action = action.CopyMode("MoveToEndOfLineContent"),
			},
			{
				key = "$",
				mods = "SHIFT",
				action = action.CopyMode("MoveToEndOfLineContent"),
			},
			{ key = ",", mods = "NONE", action = action.CopyMode("JumpReverse") },
			{ key = "0", mods = "NONE", action = action.CopyMode("MoveToStartOfLine") },
			{ key = ";", mods = "NONE", action = action.CopyMode("JumpAgain") },
			{
				key = "F",
				mods = "NONE",
				action = action.CopyMode({ JumpBackward = { prev_char = false } }),
			},
			{
				key = "F",
				mods = "SHIFT",
				action = action.CopyMode({ JumpBackward = { prev_char = false } }),
			},
			{
				key = "G",
				mods = "NONE",
				action = action.CopyMode("MoveToScrollbackBottom"),
			},
			{
				key = "G",
				mods = "SHIFT",
				action = action.CopyMode("MoveToScrollbackBottom"),
			},
			{ key = "H", mods = "NONE", action = action.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = action.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = action.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = action.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = action.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = action.CopyMode("MoveToViewportMiddle") },
			{
				key = "O",
				mods = "NONE",
				action = action.CopyMode("MoveToSelectionOtherEndHoriz"),
			},
			{
				key = "O",
				mods = "SHIFT",
				action = action.CopyMode("MoveToSelectionOtherEndHoriz"),
			},
			{
				key = "T",
				mods = "NONE",
				action = action.CopyMode({ JumpBackward = { prev_char = true } }),
			},
			{
				key = "T",
				mods = "SHIFT",
				action = action.CopyMode({ JumpBackward = { prev_char = true } }),
			},
			{
				key = "V",
				mods = "NONE",
				action = action.CopyMode({ SetSelectionMode = "Line" }),
			},
			{
				key = "V",
				mods = "SHIFT",
				action = action.CopyMode({ SetSelectionMode = "Line" }),
			},
			{
				key = "^",
				mods = "NONE",
				action = action.CopyMode("MoveToStartOfLineContent"),
			},
			{
				key = "^",
				mods = "SHIFT",
				action = action.CopyMode("MoveToStartOfLineContent"),
			},
			{ key = "b", mods = "NONE", action = action.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = action.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "CTRL", action = action.CopyMode("PageUp") },
			{ key = "c", mods = "CTRL", action = action.CopyMode("Close") },
			{ key = "d", mods = "CTRL", action = action.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "e", mods = "NONE", action = action.CopyMode("MoveForwardWordEnd") },
			{
				key = "f",
				mods = "NONE",
				action = action.CopyMode({ JumpForward = { prev_char = false } }),
			},
			{ key = "f", mods = "ALT", action = action.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "CTRL", action = action.CopyMode("PageDown") },
			{ key = "g", mods = "NONE", action = action.CopyMode("MoveToScrollbackTop") },
			{ key = "g", mods = "CTRL", action = action.CopyMode("Close") },
			{ key = "h", mods = "NONE", action = action.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = action.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = action.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = action.CopyMode("MoveRight") },
			{
				key = "m",
				mods = "ALT",
				action = action.CopyMode("MoveToStartOfLineContent"),
			},
			{
				key = "o",
				mods = "NONE",
				action = action.CopyMode("MoveToSelectionOtherEnd"),
			},
			{ key = "q", mods = "NONE", action = action.CopyMode("Close") },
			{
				key = "t",
				mods = "NONE",
				action = action.CopyMode({ JumpForward = { prev_char = true } }),
			},
			{
				key = "u",
				mods = "CTRL",
				action = action.CopyMode({ MoveByPage = -0.5 }),
			},
			{
				key = "v",
				mods = "NONE",
				action = action.CopyMode({ SetSelectionMode = "Cell" }),
			},
			{
				key = "v",
				mods = "CTRL",
				action = action.CopyMode({ SetSelectionMode = "Block" }),
			},
			{ key = "w", mods = "NONE", action = action.CopyMode("MoveForwardWord") },
			{
				key = "y",
				mods = "NONE",
				action = action.Multiple({
					{ CopyTo = "ClipboardAndPrimarySelection" },
					{ CopyMode = "Close" },
				}),
			},
			{ key = "PageUp", mods = "NONE", action = action.CopyMode("PageUp") },
			{ key = "PageDown", mods = "NONE", action = action.CopyMode("PageDown") },
			{
				key = "End",
				mods = "NONE",
				action = action.CopyMode("MoveToEndOfLineContent"),
			},
			{ key = "Home", mods = "NONE", action = action.CopyMode("MoveToStartOfLine") },
			{ key = "LeftArrow", mods = "NONE", action = action.CopyMode("MoveLeft") },
			{ key = "LeftArrow", mods = "ALT", action = action.CopyMode("MoveBackwardWord") },
			{ key = "RightArrow", mods = "NONE", action = action.CopyMode("MoveRight") },
			{ key = "RightArrow", mods = "ALT", action = action.CopyMode("MoveForwardWord") },
			{ key = "UpArrow", mods = "NONE", action = action.CopyMode("MoveUp") },
			{ key = "DownArrow", mods = "NONE", action = action.CopyMode("MoveDown") },
		},
	}

	return key_tables
end

local function setup_mac_os_mouse_bindings()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CMD",
			action = action.IncreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CMD",
			action = action.DecreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CMD",
			action = action.ResetFontSize,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CMD",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}
	return mouse_bindings
end

local function setup_other_os_mouse_bindings()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = action.IncreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = action.DecreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CTRL",
			action = action.ResetFontSize,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}

	return mouse_bindings
end

local function setup_mouse_bindings()
	local mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = action.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = action.ScrollByCurrentEventWheelDelta,
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Cell"),
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 1, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Cell"),
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			action = action.ClearSelection,
			mods = "NONE",
		},
		{
			event = { Down = { streak = 1, button = "Left" } },
			action = action.ClearSelection,
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Word"),
			mods = "NONE",
		},
		{
			event = { Down = { streak = 2, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Word"),
			mods = "SHIFT",
		},
		{
			event = { Drag = { streak = 2, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Word"),
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 2, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Word"),
			mods = "SHIFT",
		},
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Line"),
			mods = "NONE",
		},
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = action.SelectTextAtMouseCursor("Line"),
			mods = "SHIFT",
		},
		{
			event = { Drag = { streak = 3, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Line"),
			mods = "NONE",
		},
		{
			event = { Drag = { streak = 3, button = "Left" } },
			action = action.ExtendSelectionToMouseCursor("Line"),
			mods = "SHIFT",
		},
	}

	local os_specific_mouse_bindings = {}
	if platform.is_mac == true then
		os_specific_mouse_bindings = setup_mac_os_mouse_bindings()
	else
		os_specific_mouse_bindings = setup_other_os_mouse_bindings()
	end

	table_utils.merge(mouse_bindings, os_specific_mouse_bindings)

	return mouse_bindings
end

return {
	leader = setup_leader(),
	keys = setup_keys(),
	key_tables = setup_key_tables(),
	mouse_bindings = setup_mouse_bindings(),
}
