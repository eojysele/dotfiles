local E = {}

local wezterm = require("wezterm")

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function E.setup()
	wezterm.on("format-window-title", function()
		return "WezTerm"
	end)

	wezterm.on("format-tab-title", function(tab)
		local tab_index = tab.tab_index + 1
		local active_pane = tab.active_pane
		local process_name = basename(active_pane.foreground_process_name)

		return " " .. tab_index .. " " .. process_name .. " "
	end)

	wezterm.on("toggle-leader", function(window, _)
		local overrides = window:get_config_overrides() or {}
		if not overrides.leader then
			overrides.leader = { key = "_", mods = "CTRL|ALT|SUPER" }
		else
			overrides.leader = nil
		end
		window:set_config_overrides(overrides)
	end)

	wezterm.on("toggle-tabbar", function(window, _)
		local overrides = window:get_config_overrides() or {}
		if overrides.enable_tab_bar == false then
			overrides.enable_tab_bar = true
		else
			overrides.enable_tab_bar = false
		end
		window:set_config_overrides(overrides)
	end)
end

return E
