local E = {}

function E.setup(wezterm)
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
