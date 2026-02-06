return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Go
		vim.lsp.enable("gopls")

		-- JavaScript/TypeScript
		vim.lsp.enable("ts_ls")

		-- JavaScript Linter
		vim.lsp.enable("eslint")

		-- Markdown
		vim.lsp.enable("marksman")

		-- Lua
		vim.lsp.enable("lua_ls")

		-- HTML
		vim.lsp.enable("html")
		vim.lsp.config("html", {
			capabilities = capabilities,
		})

		-- JSON
		vim.lsp.enable("jsonls")
		vim.lsp.config("jsonls", {
			capabilities = capabilities,
		})

		-- XML
		vim.lsp.enable("lemminx")

		-- YAML
		vim.lsp.enable("yamlls")
		vim.lsp.config("yamlls", {
			settings = {
				redhat = {
					telemetry = {
						enabled = false,
					},
				},
			},
		})

		-- Dockerfile
		vim.lsp.enable("dockerls")

		-- Docker Compose
		vim.lsp.enable("docker_compose_language_service")

		-- Bash
		vim.lsp.enable("bashls")
		vim.lsp.config("bashls", {
			filetypes = { "sh", "zsh", "bash" },
		})
	end,
}
