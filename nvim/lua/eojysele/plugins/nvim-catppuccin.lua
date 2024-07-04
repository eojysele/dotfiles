return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			integrations = {
				treesitter = true,
				nvimtree = true,
				dap = {
					enabled = true,
				},
				mason = true,
			},
			custom_highlights = function(colors)
				return {
					NonText = { fg = colors.surface0 },
					SpecialKey = { fg = colors.surface0 },
					Whitespace = { fg = colors.surface0 },
					NormalFloat = { bg = colors.base },
					FloatBorder = { bg = colors.base },
					TabLine = { fg = colors.overlay0, bg = colors.mantle },
					TabLineFill = { fg = colors.text, bg = colors.crust },
					TabLineSel = { fg = colors.text, bg = colors.base },
					NvimTreeModifiedIcon = { fg = colors.text },
					NvimTreeGitStagedIcon = { fg = colors.green },
					NvimTreeGitDeletedIcon = { fg = colors.red },
					NvimTreeGitDirtyIcon = { fg = colors.yellow },
				}
			end
		})

		vim.cmd.colorscheme "catppuccin"
	end
}
