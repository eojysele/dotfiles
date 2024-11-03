local wezterm = require("wezterm")
local action = wezterm.action

local os_utils = require("core.utils.os")
local table_utils = require("core.utils.table")

local function setup_leader()
	local leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 }

	if os_utils.is_mac_os() == false then
		leader.mods = "ALT"
	end

	return leader
end

local function setup_general_keys()
	local keys = {
		{ key = "d", mods = "LEADER", action = action.SplitHorizontal { domain = "CurrentPaneDomain" }, },
		{ key = "D", mods = "LEADER", action = action.SplitVertical { domain = "CurrentPaneDomain" }, },
		{ key = "w", mods = "LEADER", action = action.CloseCurrentPane { confirm = true } },
		{ key = "f", mods = "LEADER", action = action.TogglePaneZoomState },
		{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection "Left" },
		{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection "Down" },
		{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection "Up" },
		{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection "Right" },
		{ key = "r", mods = "LEADER", action = action.ActivateKeyTable { name = "resize_pane", timeout_milliseconds = 1000, one_shot = false, }, },
		{ key = "s", mods = "LEADER", action = action.PaneSelect { alphabet = "1234567890", }, },
		{ key = "S", mods = "LEADER", action = action.PaneSelect { alphabet = "1234567890", mode = "SwapWithActive", }, },
		{ key = "n", mods = "LEADER", action = action { EmitEvent = "toggle-tabbar" } },
	}

	return keys
end

local function setup_mac_os_keys()
	local keys = {
		{ key = "q",          mods = "CMD",        action = action.QuitApplication },
		{ key = "h",          mods = "CMD",        action = action.HideApplication },
		{ key = "m",          mods = "CMD",        action = action.Hide },
		{ key = "c",          mods = "CMD",        action = action.CopyTo "Clipboard" },
		{ key = "v",          mods = "CMD",        action = action.PasteFrom "Clipboard" },
		{ key = "t",          mods = "CMD",        action = action.SpawnTab "CurrentPaneDomain" },
		{ key = "w",          mods = "CMD",        action = action.CloseCurrentTab { confirm = true } },
		{ key = "n",          mods = "CMD",        action = action.SpawnWindow },
		{ key = "Tab",        mods = "CTRL",       action = action.ActivateTabRelative(1) },
		{ key = "Tab",        mods = "SHIFT|CTRL", action = action.ActivateTabRelative(-1) },
		{ key = "[",          mods = "CMD",        action = action.ActivateTabRelative(-1) },
		{ key = "]",          mods = "CMD",        action = action.ActivateTabRelative(1) },
		{ key = "{",          mods = "CMD|SHIFT",  action = action.MoveTabRelative(-1) },
		{ key = "}",          mods = "CMD|SHIFT",  action = action.MoveTabRelative(1) },
		{ key = "a",          mods = "CMD",        action = action.SendKey { key = "b", mods = "CTRL" } },
		{ key = "LeftArrow",  mods = "CMD",        action = action.SendKey { key = "a", mods = "CTRL" } },
		{ key = "RightArrow", mods = "CMD",        action = action.SendKey { key = "e", mods = "CTRL" } },
		{ key = "LeftArrow",  mods = "OPT",        action = action.SendKey { key = "b", mods = "ALT" } },
		{ key = "RightArrow", mods = "OPT",        action = action.SendKey { key = "f", mods = "ALT" } },
		{ key = "Backspace",  mods = "CMD",        action = action.SendKey { key = "u", mods = "CTRL" } },
		{ key = "Backspace",  mods = "OPT",        action = action.SendKey { key = "w", mods = "CTRL" } },
		{ key = "/",          mods = "CMD",        action = action { EmitEvent = "toggle-leader" } },
		{ key = "+",          mods = "CMD",        action = action.IncreaseFontSize },
		{ key = "-",          mods = "CMD",        action = action.DecreaseFontSize },
		{ key = "0",          mods = "CMD",        action = action.ResetFontSize },
		{ key = "f",          mods = "CMD",        action = action.Search "CurrentSelectionOrEmptyString" },
	}

	for i = 1, 9 do
		local key = { key = tostring(i), mods = "CMD", action = action.ActivateTab(i - 1), }
		table.insert(keys, key)
	end


	return keys
end

local function setup_other_os_keys()
	local keys = {

	}

	return keys
end

local function setup_keys()
	local keys = setup_general_keys()

	local os_specific_keys = {}
	if os_utils.is_mac_os() == true then
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
			{ key = "Enter",     mods = "NONE", action = action.CopyMode "PriorMatch" },
			{ key = "Escape",    mods = "NONE", action = action.CopyMode "Close" },
			{ key = "n",         mods = "CTRL", action = action.CopyMode "NextMatch" },
			{ key = "p",         mods = "CTRL", action = action.CopyMode "PriorMatch" },
			{ key = "r",         mods = "CTRL", action = action.CopyMode "CycleMatchType" },
			{ key = "u",         mods = "CTRL", action = action.CopyMode "ClearPattern" },
			{ key = "PageUp",    mods = "NONE", action = action.CopyMode "PriorMatchPage" },
			{ key = "PageDown",  mods = "NONE", action = action.CopyMode "NextMatchPage" },
			{ key = "UpArrow",   mods = "NONE", action = action.CopyMode "PriorMatch" },
			{ key = "DownArrow", mods = "NONE", action = action.CopyMode "NextMatch" },
		},
		resize_pane = {
			{ key = "h",      action = action.AdjustPaneSize { "Left", 5 } },
			{ key = "j",      action = action.AdjustPaneSize { "Down", 5 } },
			{ key = "k",      action = action.AdjustPaneSize { "Up", 5 } },
			{ key = "l",      action = action.AdjustPaneSize { "Right", 5 } },
			{ key = "Escape", action = "PopKeyTable" },
		},
	}

	return key_tables
end

local function setup_mouse_bindings()
	local mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = action.Nop,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "SHIFT",
			action = action.Nop,
		},
	}

	return mouse_bindings
end

local leader = setup_leader()
local keys = setup_keys()
local key_tables = setup_key_tables()
local mouse_bindings = setup_mouse_bindings()

return {
	leader = leader,
	keys = keys,
	key_tables = key_tables,
	mouse_bindings = mouse_bindings,
}
