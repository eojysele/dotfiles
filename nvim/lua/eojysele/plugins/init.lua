local function load_plugins()
	local plugins = {}
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/eojysele/plugins"

	for file in vim.fs.dir(plugin_dir) do
		if file:match("^nvim-.*%.lua$") then
			local module_name = "eojysele.plugins." .. file:gsub("%.lua$", "")
			table.insert(plugins, require(module_name))
		end
	end

	return plugins
end

return load_plugins()
