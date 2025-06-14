local PK = {}

local wezterm = require("wezterm")
local send_keys = require("core.bindings.action.keys.send_key").get()

local function is_powershell(pane)
	local process = pane:get_foreground_process_name()
	return string.find(process, "powershell") ~= nil
end

local function two_action(first_action, second_action)
	return wezterm.action_callback(function(window, pane)
		if is_powershell(pane) then
			window:perform_action(first_action, pane)
		else
			window:perform_action(second_action, pane)
		end
	end)
end

function PK.get()
	return {
		BeginningOfLine = two_action(send_keys.Home, send_keys.Ctrl_A),
		EndOfLine = two_action(send_keys.End, send_keys.Ctrl_E),
		BackwardWord = two_action(send_keys.Ctrl_LeftArrow, send_keys.Alt_B),
		ForwardWord = two_action(send_keys.Ctrl_RightArrow, send_keys.Alt_F),
		BackwardKillWord = two_action(send_keys.Ctrl_Backspace, send_keys.Ctrl_W),
		BackwardKillLine = send_keys.Ctrl_U,
	}
end

return PK
