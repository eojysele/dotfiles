return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"java",
				"go",
				"html",
				"xml",
				"json",
				"yaml",
				"dockerfile",
			},
			sync_install = true,
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
