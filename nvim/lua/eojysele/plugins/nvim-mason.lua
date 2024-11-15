return {
	"williamboman/mason.nvim",
	config = function()
		local mason = require("mason")

		mason.setup({
			ui = {
				border = "rounded",
				width = 0.6,
				height = 0.8,
			},
		})

		-- Auto install mason packages
		local mason_registry = require("mason-registry")

		local required_packages = {
			"jdtls",
			"gopls",
			"typescript-language-server",
			"eslint-lsp",
			"lua-language-server",
			"html-lsp",
			"marksman",
			"lemminx",
			"json-lsp",
			"yaml-language-server",
			"dockerfile-language-server",
			"docker-compose-language-service",
			"bash-language-server",
		}

		local required_packages_name = ""

		for _, required_package in ipairs(required_packages) do
			if mason_registry.is_installed(required_package) == false then
				required_packages_name = required_packages_name .. required_package .. " "
			end
		end

		if required_packages_name ~= "" then
			vim.cmd("MasonInstall " .. required_packages_name)
		end
	end,
}
