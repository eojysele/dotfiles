local M = {}

local wezterm = require("wezterm")
local action = wezterm.action

function M.get()
	return {
		ScrollByCurrentEventWheelDelta = action.ScrollByCurrentEventWheelDelta,
		ExtendSelectionToMouseCursorCell = action.ExtendSelectionToMouseCursor("Cell"),
		ExtendSelectionToMouseCursorWord = action.ExtendSelectionToMouseCursor("Word"),
		ExtendSelectionToMouseCursorLine = action.ExtendSelectionToMouseCursor("Line"),
		SelectTextAtMouseCursorWord = action.SelectTextAtMouseCursor("Word"),
		SelectTextAtMouseCursorLine = action.SelectTextAtMouseCursor("Line"),
		ClearSelection = action.ClearSelection,
		OpenLinkAtMouseCursor = action.OpenLinkAtMouseCursor,
	}
end

return M
