return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		-- Go
		lspconfig.gopls.setup({})

		-- JavaScript/TypeScript
		lspconfig.ts_ls.setup({})

		-- JavaScript Linter
		lspconfig.eslint.setup({})

		-- Markdown
		lspconfig.marksman.setup({})

		-- Lua
		lspconfig.lua_ls.setup({})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- JSON
		lspconfig.jsonls.setup({
			capabilities = capabilities,
		})

		-- XML
		lspconfig.lemminx.setup({})

		-- YAML
		lspconfig.yamlls.setup({
			settings = {
				redhat = {
					telemetry = {
						enabled = false,
					},
				},
			},
		})

		-- Dockerfile
		lspconfig.dockerls.setup({})

		-- Docker Compose
		lspconfig.docker_compose_language_service.setup({})

		-- Bash
		lspconfig.bashls.setup({
			filetypes = { "sh", "zsh", "bash" },
		})
	end,
}
