local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

function K.get()
	local keys = {
		{
			key = "d",
			mods = "LEADER",
			action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "LEADER|SHIFT",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{ key = "w", mods = "LEADER", action = action.CloseCurrentPane({ confirm = false }) },
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
		{
			key = "s",
			mods = "LEADER",
			action = action.PaneSelect({ alphabet = "1234567890" }),
		},
		{
			key = "S",
			mods = "LEADER|SHIFT",
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

return K
