local K = {}

local MACOS = {
	APPLE = "aarch64-apple-darwin",
	INTEL = "x86_64-apple-darwin",
}

local function set_send_key(wezterm, keybind, send_keybind)
	return {
		key = keybind.key,
		mods = keybind.mods,
		action = wezterm.action.SendKey {
			key = send_keybind.key,
			mods = send_keybind.mods,
		},
	}
end

local function set_disabled(wezterm, keybind)
	return {
		key = keybind.key,
		mods = keybind.mods,
		action = wezterm.action.DisableDefaultAssignment,
	}
end

local function get_disabled_keybinds(wezterm)
	local keys = {
		set_disabled(wezterm, { key = "Z", mods = "CMD|SHIFT" }),
		set_disabled(wezterm, { key = "Z", mods = "CTRL|SHIFT" }),
		set_disabled(wezterm, { key = "w", mods = "CMD" }),
		set_disabled(wezterm, { key = "t", mods = "CMD" }),
		set_disabled(wezterm, { key = "W", mods = "CTRL|SHIFT" }),
		set_disabled(wezterm, { key = "T", mods = "CTRL|SHIFT" }),
	}

	return keys
end

local function get_general_keybinds(wezterm)
	local keys = {
		{ key = "d", mods = "LEADER",       action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }, },
		{ key = "D", mods = "LEADER|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }, },
		{ key = "w", mods = "LEADER",       action = wezterm.action.CloseCurrentPane { confirm = true } },
		{ key = "t", mods = "LEADER",       action = wezterm.action.SpawnTab "CurrentPaneDomain" },
		{ key = "f", mods = "LEADER",       action = wezterm.action.TogglePaneZoomState },
		{ key = "h", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection "Left" },
		{ key = "j", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection "Down" },
		{ key = "k", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection "Up" },
		{ key = "l", mods = "LEADER",       action = wezterm.action.ActivatePaneDirection "Right" },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize { "Down", 5 } },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action.AdjustPaneSize { "Right", 5 } },
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action.PaneSelect {
				alphabet = "1234567890",
			},
		},
		{
			key = "e",
			mods = "LEADER",
			action = wezterm.action.PaneSelect {
				alphabet = "1234567890",
				mode = "SwapWithActive",
			},
		},
		{ key = "[", mods = "LEADER",       action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "]", mods = "LEADER",       action = wezterm.action.ActivateTabRelative(1) },
		{ key = "{", mods = "LEADER|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "}", mods = "LEADER|SHIFT", action = wezterm.action.MoveTabRelative(1) },
		{ key = "n", mods = "LEADER",       action = wezterm.action { EmitEvent = "toggle-tabbar" } },
	}

	return keys
end

local function get_mac_os_keybinds(wezterm)
	local keys = {
		set_send_key(wezterm, { key = "a", mods = "CMD", }, { key = "b", mods = "CTRL", }),
		set_send_key(wezterm, { key = "LeftArrow", mods = "CMD" }, { key = "a", mods = "CTRL" }),
		set_send_key(wezterm, { key = "RightArrow", mods = "CMD" }, { key = "e", mods = "CTRL" }),
		set_send_key(wezterm, { key = "LeftArrow", mods = "OPT" }, { key = "b", mods = "ALT" }),
		set_send_key(wezterm, { key = "RightArrow", mods = "OPT" }, { key = "f", mods = "ALT" }),
		set_send_key(wezterm, { key = "Backspace", mods = "CMD" }, { key = "u", mods = "CTRL" }),
		set_send_key(wezterm, { key = "Backspace", mods = "OPT" }, { key = "w", mods = "CTRL" }),
		{ key = "/", mods = "CMD", action = wezterm.action { EmitEvent = "toggle-leader" } },
	}

	return keys
end

local function get_linux_and_window_keybinds(wezterm)
	local keys = {
		set_send_key(wezterm, { key = "a", mods = "ALT", }, { key = "b", mods = "CTRL", }),
		set_send_key(wezterm, { key = "LeftArrow", mods = "CTRL" }, { key = "a", mods = "CTRL" }),
		set_send_key(wezterm, { key = "RightArrow", mods = "CTRL" }, { key = "e", mods = "CTRL" }),
		set_send_key(wezterm, { key = "LeftArrow", mods = "ALT" }, { key = "b", mods = "ALT" }),
		set_send_key(wezterm, { key = "RightArrow", mods = "ALT" }, { key = "f", mods = "ALT" }),
		set_send_key(wezterm, { key = "Backspace", mods = "CTRL" }, { key = "u", mods = "CTRL" }),
		set_send_key(wezterm, { key = "Backspace", mods = "ALT" }, { key = "w", mods = "CTRL" }),
		{
			key = "c",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				local selection_text = window:get_selection_text_for_pane(pane)
				local is_selection_active = string.len(selection_text) ~= 0
				if is_selection_active then
					window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
				else
					window:perform_action(wezterm.action.SendKey { key = "c", mods = "CTRL" }, pane)
				end
			end),
		},
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom "Clipboard" },
		set_send_key(wezterm, { key = "V", mods = "CTRL|SHIFT" }, { key = "v", mods = "CTRL" }),
		{ key = "/", mods = "ALT",  action = wezterm.action { EmitEvent = "toggle-leader" } },
	}

	return keys
end

local function merge(into, from)
	for _, element in ipairs(from) do
		table.insert(into, element)
	end
end

function K.setup_leader(wezterm)
	local os = wezterm.target_triple

	local leader = {}
	if os == MACOS.APPLE or os == MACOS.INTEL then
		leader = { key = "a", mods = "CMD" }
	else
		leader = { key = "a", mods = "ALT" }
	end

	return leader
end

function K.setup_keyboard_bindings(wezterm)
	local os = wezterm.target_triple

	local keys = {}
	if os == MACOS.APPLE or os == MACOS.INTEL then
		keys = get_mac_os_keybinds(wezterm)
	else
		keys = get_linux_and_window_keybinds(wezterm)
	end

	local general_keys = get_general_keybinds(wezterm)
	local disabled_keys = get_disabled_keybinds(wezterm)

	merge(keys, general_keys)
	merge(keys, disabled_keys)

	return keys
end

function K.setup_mouse_bindigns(wezterm)
	return {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = wezterm.action.Nop,
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "SHIFT",
			action = wezterm.action.Nop,
		},
	}
end

return K
