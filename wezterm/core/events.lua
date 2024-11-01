local E = {}

function E.setup(wezterm)
	wezterm.on("toggle-leader", function(window, pane)
		local overrides = window:get_config_overrides() or {}
		if not overrides.leader then
			-- replace it with an "impossible" leader that will enver be pressed
			overrides.leader = { key = "_", mods = "CTRL|ALT|SUPER" }
			wezterm.log_warn("[leader] clear")
		else
			-- restore to the main leader
			overrides.leader = nil
			wezterm.log_warn("[leader] set")
		end
		window:set_config_overrides(overrides)
	end)
end

return E

