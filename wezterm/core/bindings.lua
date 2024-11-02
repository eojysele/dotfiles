local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

local os_utils = require("core.utils.os")
local table_utils = require("core.utils.table")

local function set_send_key(keybind, send_keybind)
	return {
		key = keybind.key,
		mods = keybind.mods,
		action = action.SendKey {
			key = send_keybind.key,
			mods = send_keybind.mods,
		},
	}
end

local function set_disabled(keybind)
	return {
		key = keybind.key,
		mods = keybind.mods,
		action = action.DisableDefaultAssignment,
	}
end

local function get_disabled_keybinds()
	local keys = {
		set_disabled({ key = "Z", mods = "CMD|SHIFT" }),
		set_disabled({ key = "Z", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "w", mods = "CMD" }),
		set_disabled({ key = "t", mods = "CMD" }),
		set_disabled({ key = "W", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "T", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "!", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "@", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "#", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "$", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "%", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "^", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "&", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "*", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "(", mods = "CTRL|SHIFT" }),
		set_disabled({ key = "W", mods = "CTRL" }),
		set_disabled({ key = "T", mods = "CTRL" }),
		set_disabled({ key = "!", mods = "CTRL" }),
		set_disabled({ key = "@", mods = "CTRL" }),
		set_disabled({ key = "#", mods = "CTRL" }),
		set_disabled({ key = "$", mods = "CTRL" }),
		set_disabled({ key = "%", mods = "CTRL" }),
		set_disabled({ key = "^", mods = "CTRL" }),
		set_disabled({ key = "&", mods = "CTRL" }),
		set_disabled({ key = "*", mods = "CTRL" }),
		set_disabled({ key = "(", mods = "CTRL" }),
	}

	for i = 1, 9 do
		table.insert(keys, set_disabled({ key = tostring(i), mods = "CMD" }))
		table.insert(keys, set_disabled({ key = tostring(i), mods = "CTRL|SHIFT" }))
	end

	return keys
end

local function get_general_keybinds()
	local keys = {
		{ key = "d", mods = "LEADER", action = action.SplitHorizontal { domain = "CurrentPaneDomain" }, },
		{ key = "D", mods = "LEADER", action = action.SplitVertical { domain = "CurrentPaneDomain" }, },
		{ key = "w", mods = "LEADER", action = action.CloseCurrentPane { confirm = true } },
		{ key = "t", mods = "LEADER", action = action.SpawnTab "CurrentPaneDomain" },
		{ key = "f", mods = "LEADER", action = action.TogglePaneZoomState },
		{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection "Left" },
		{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection "Down" },
		{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection "Up" },
		{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection "Right" },
		{
			key = "r",
			mods = "LEADER",
			action = action.ActivateKeyTable {
				name = "resize_pane",
				timeout_milliseconds = 1000,
				one_shot = false,
			},
		},
		{
			key = "s",
			mods = "LEADER",
			action = action.PaneSelect {
				alphabet = "1234567890",
			},
		},
		{
			key = "S",
			mods = "LEADER",
			action = action.PaneSelect {
				alphabet = "1234567890",
				mode = "SwapWithActive",
			},
		},
		{ key = "[", mods = "LEADER",       action = action.ActivateTabRelative(-1) },
		{ key = "]", mods = "LEADER",       action = action.ActivateTabRelative(1) },
		{ key = "{", mods = "LEADER|SHIFT", action = action.MoveTabRelative(-1) },
		{ key = "}", mods = "LEADER|SHIFT", action = action.MoveTabRelative(1) },
		{ key = "n", mods = "LEADER",       action = action { EmitEvent = "toggle-tabbar" } },
	}

	for i = 1, 9 do
		local key = { key = tostring(i), mods = "LEADER", action = action.ActivateTab(i - 1), }
		table.insert(keys, key)
	end

	return keys
end

local function get_mac_os_keybinds()
	local keys = {
		set_send_key({ key = "a", mods = "CMD", }, { key = "b", mods = "CTRL", }),
		set_send_key({ key = "LeftArrow", mods = "CMD" }, { key = "a", mods = "CTRL" }),
		set_send_key({ key = "RightArrow", mods = "CMD" }, { key = "e", mods = "CTRL" }),
		set_send_key({ key = "LeftArrow", mods = "OPT" }, { key = "b", mods = "ALT" }),
		set_send_key({ key = "RightArrow", mods = "OPT" }, { key = "f", mods = "ALT" }),
		set_send_key({ key = "Backspace", mods = "CMD" }, { key = "u", mods = "CTRL" }),
		set_send_key({ key = "Backspace", mods = "OPT" }, { key = "w", mods = "CTRL" }),
		{ key = "/", mods = "CMD", action = action { EmitEvent = "toggle-leader" } },
	}

	return keys
end

local function get_linux_and_window_keybinds()
	local keys = {
		set_send_key({ key = "a", mods = "ALT", }, { key = "b", mods = "CTRL", }),
		set_send_key({ key = "LeftArrow", mods = "CTRL" }, { key = "a", mods = "CTRL" }),
		set_send_key({ key = "RightArrow", mods = "CTRL" }, { key = "e", mods = "CTRL" }),
		set_send_key({ key = "LeftArrow", mods = "ALT" }, { key = "b", mods = "ALT" }),
		set_send_key({ key = "RightArrow", mods = "ALT" }, { key = "f", mods = "ALT" }),
		set_send_key({ key = "Backspace", mods = "CTRL" }, { key = "u", mods = "CTRL" }),
		set_send_key({ key = "Backspace", mods = "ALT" }, { key = "w", mods = "CTRL" }),
		{
			key = "c",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				local selection_text = window:get_selection_text_for_pane(pane)
				local is_selection_active = string.len(selection_text) ~= 0
				if is_selection_active then
					window:perform_action(action.CopyTo("ClipboardAndPrimarySelection"), pane)
				else
					window:perform_action(action.SendKey { key = "c", mods = "CTRL" }, pane)
				end
			end),
		},
		{ key = "v", mods = "CTRL", action = action.PasteFrom "Clipboard" },
		set_send_key({ key = "V", mods = "CTRL|SHIFT" }, { key = "v", mods = "CTRL" }),
		{ key = "/", mods = "ALT",  action = action { EmitEvent = "toggle-leader" } },
	}

	return keys
end

function K.setup_leader()
	local leader = { key = "A", mods = "CMD", }

	if os_utils.is_mac_os() == false then
		leader.mods = "ALT"
	end

	return leader
end

function K.setup_keyboard_bindings()
	local keys = {}
	if os_utils.is_mac_os() == true then
		keys = get_mac_os_keybinds()
	else
		keys = get_linux_and_window_keybinds()
	end

	local general_keys = get_general_keybinds()
	local disabled_keys = get_disabled_keybinds()

	table_utils.merge(keys, general_keys)
	table_utils.merge(keys, disabled_keys)

	return keys
end

function K.setup_key_tables()
	return {
		resize_pane = {
			{ key = "h",      action = action.AdjustPaneSize { "Left", 5 } },
			{ key = "j",      action = action.AdjustPaneSize { "Down", 5 } },
			{ key = "k",      action = action.AdjustPaneSize { "Up", 5 } },
			{ key = "l",      action = action.AdjustPaneSize { "Right", 5 } },
			{ key = 'Escape', action = 'PopKeyTable' },
		}
	}
end

function K.setup_mouse_bindigns()
	return {
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
end

return K
