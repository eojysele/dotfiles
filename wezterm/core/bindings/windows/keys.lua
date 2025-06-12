local K = {}

local wezterm = require("wezterm")
local action = wezterm.action

local table_utils = require("core.utils.table")
local wl_keys = require("core.bindings.shared.wl.keys")

local function is_powershell(pane)
	local process = pane:get_foreground_process_name()
	return string.find(process, "powershell") ~= nil
end

local function send_key_with_powershell(bind, first_send_key, second_send_key)
	return {
		key = bind.key,
		mods = bind.mods,
		action = wezterm.action_callback(function(window, pane)
			if is_powershell(pane) then
				window:perform_action(
					action.SendKey({ key = first_send_key.key, mods = first_send_key.mods }),
					pane
				)
			else
				window:perform_action(
					action.SendKey({ key = second_send_key.key, mods = second_send_key.mods }),
					pane
				)
			end
		end),
	}
end

function K.get()
	local keys = {
		{
			key = "t",
			mods = "ALT",
			action = action.ShowLauncherArgs({
				flags = "LAUNCH_MENU_ITEMS",
			}),
		},
		send_key_with_powershell(
			{ key = "LeftArrow", mods = "CTRL" },
			{ key = "LeftArrow", mods = "CTRL" },
			{ key = "b", mods = "ALT" }
		),
		send_key_with_powershell(
			{ key = "RightArrow", mods = "CTRL" },
			{ key = "RightArrow", mods = "CTRL" },
			{ key = "f", mods = "ALT" }
		),
		send_key_with_powershell(
			{ key = "LeftArrow", mods = "CTRL|SHIFT" },
			{ key = "Home", mods = "NONE" },
			{ key = "a", mods = "CTRL" }
		),
		send_key_with_powershell(
			{ key = "RightArrow", mods = "CTRL|SHIFT" },
			{ key = "End", mods = "NONE" },
			{ key = "e", mods = "CTRL" }
		),
		send_key_with_powershell({
			key = "Backspace",
			mods = "CTRL",
		}, {
			key = "Backspace",
			mods = "CTRL",
		}, { key = "w", mods = "CTRL" }),
		{
			key = "Backspace",
			mods = "CTRL|SHIFT",
			action = action.SendKey({ key = "u", mods = "CTRL" }),
		},
	}
	table_utils.safe_merge(keys, wl_keys.get())

	return keys
end

return K
