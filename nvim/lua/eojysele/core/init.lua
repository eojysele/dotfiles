local base_path = "eojysele.core"

local options = {
	settings = {
		"options",
		"ui",
		"keymaps"
	},
	global = {
		"tabline"
	}
}

for category, modules in pairs(options) do
	for _, module in pairs(modules) do
		local module_full_name = base_path .. "." .. category .. "." .. module
		require(module_full_name)
	end
end
