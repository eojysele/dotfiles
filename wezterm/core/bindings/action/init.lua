local A = {}

local wezterm = require("wezterm")
local action = wezterm.action
local send_key_actions = require("core.bindings.action.send_key").get()
local shell_actions = require("core.bindings.action.shell").get()
local powershell_actions = require("core.bindings.action.powershell").get()
local mouse_actions = require("core.bindings.action.mouse").get()

local params = {
	confirm = true,
}

function A.get()
	local actions = {
		Multiple = function(action_sequence)
			return action.Multiple(action_sequence)
		end,
		ShowDebugOverlay = action.ShowDebugOverlay,
		LaunchMenu = action.ShowLauncherArgs({
			flags = "LAUNCH_MENU_ITEMS",
		}),

		ToggleLeader = action({ EmitEvent = "toggle-leader" }),
		TmuxLeader = action.SendKey({ key = "b", mods = "CTRL" }),

		CopyToClipboard = action.CopyTo("Clipboard"),
		CopyToClipboardOrSIGINT = wezterm.action_callback(function(window, pane)
			local selection_text = window:get_selection_text_for_pane(pane)
			local is_selection_active = string.len(selection_text) ~= 0
			if is_selection_active then
				window:perform_action(
					action.Multiple({
						action.CopyTo("Clipboard"),
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
		PasteFromClipboard = action.PasteFrom("Clipboard"),

		QuitApplication = action.QuitApplication,
		HideApplication = action.HideApplication,
		Hide = action.Hide,
		ToggleFullScreen = action.ToggleFullScreen,

		NewWindow = action.SpawnWindow,
		NewTab = action.SpawnTab("CurrentPaneDomain"),
		CloseTab = action.CloseCurrentTab({ confirm = params.confirm }),
		NextTab = action.ActivateTabRelative(1),
		PreviousTab = action.ActivateTabRelative(-1),
		MoveTabLeft = action.MoveTabRelative(-1),
		MoveTabRight = action.MoveTabRelative(1),
		ActivateTab = function(tab_number)
			return action.ActivateTab(tab_number - 1)
		end,
		SplitHorizontal = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		SplitVertical = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		CloseCurrentPane = action.CloseCurrentPane({ confirm = params.confirm }),
		ActivatePaneDirectionLeft = action.ActivatePaneDirection("Left"),
		ActivatePaneDirectionRight = action.ActivatePaneDirection("Right"),
		ActivatePaneDirectionDown = action.ActivatePaneDirection("Down"),
		ActivatePaneDirectionUp = action.ActivatePaneDirection("Up"),
		AdjustPaneSizeLeft = action.AdjustPaneSize({ "Left", 5 }),
		AdjustPaneSizeRight = action.AdjustPaneSize({ "Right", 5 }),
		AdjustPaneSizeDown = action.AdjustPaneSize({ "Down", 5 }),
		AdjustPaneSizeUp = action.AdjustPaneSize({ "Up", 5 }),
		TogglePaneZoomState = action.TogglePaneZoomState,
		ActivateCopyMode = action.ActivateCopyMode,
		ActivateResizePane = action.ActivateKeyTable({
			name = "resize_pane",
			timeout_milliseconds = 1000,
			one_shot = false,
		}),
		ActivateSelectPane = action.ActivateKeyTable({
			name = "select_pane",
			timeout_milliseconds = 1000,
			one_shot = false,
		}),
		PaneSelect = action.PaneSelect({ alphabet = "1234567890" }),
		PaneSelectAndSwapWithActive = action.PaneSelect({
			alphabet = "1234567890",
			mode = "SwapWithActive",
		}),

		Search = action.Search("CurrentSelectionOrEmptyString"),
		ScrollToTop = action.ScrollToTop,
		ScrollToBottom = action.ScrollToBottom,
		ScrollPageUp = action.ScrollByPage(-0.5),
		ScrollPageDown = action.ScrollByPage(0.5),
		ClearViewPort = action.SendKey({ key = "l", mods = "CTRL" }),
		ClearScrollbackOnly = action.ClearScrollback("ScrollbackOnly"),

		IncreaseFontSize = action.IncreaseFontSize,
		DecreaseFontSize = action.DecreaseFontSize,
		ResetFontSize = action.ResetFontSize,

		Shell = shell_actions,
		PowerShell = powershell_actions,
		SendKey = send_key_actions,
		Mouse = mouse_actions,
	}

	return actions
end

return A
