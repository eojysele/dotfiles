require "nvim-treesitter.configs".setup {
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"javascript",
		"java",
		"rust",
		"html",
		"xml",
		"json",
		"yaml",
		"dockerfile"
	},
	sync_install = true,
	auto_install = false,
	highlight = {
		enable = true,
	},
}
