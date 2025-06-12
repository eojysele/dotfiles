local KT = {}

local wezterm = require("wezterm")
local action = wezterm.action

function KT.get()
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
				mods = "Ctrl",
				action = action.CopyMode("MoveToEndOfLineContent"),
			},
			{ key = "Home", mods = "Ctrl", action = action.CopyMode("MoveToStartOfLine") },
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

return KT
