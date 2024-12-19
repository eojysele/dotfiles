return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				treesitter_context = false,
				telescope = {
					enabled = true,
				},
				nvimtree = true,
				mason = true,
			},
			custom_highlights = function(colors)
				return {
					CursorColumn = { bg = colors.surface0 },
					CursorLine = { bg = colors.surface0 },
					NonText = { fg = colors.surface2 },
					SpecialKey = { fg = colors.surface2 },
					Whitespace = { fg = colors.surface2 },
					ColorColumn = { bg = colors.surface2 },
					NormalFloat = { bg = colors.base },
					FloatBorder = { bg = colors.base },
					MsgArea = { fg = colors.text, bg = colors.crust },
					TabLine = { fg = colors.overlay0, bg = colors.mantle },
					TabLineFill = { fg = colors.text, bg = colors.crust },
					TabLineSel = { fg = colors.text, bg = colors.base },
					CursorLineNr = { fg = colors.text, style = { "bold" } },
					LineNr = { fg = colors.surface2 },
					NvimTreeModifiedIcon = { fg = colors.text },
					NvimTreeGitStagedIcon = { fg = colors.green },
					NvimTreeGitDeletedIcon = { fg = colors.red },
					NvimTreeGitDirtyIcon = { fg = colors.yellow },
					TreesitterContext = { bg = colors.base },
					TreesitterContextLineNumber = {
						fg = colors.surface2,
						bg = colors.base,
					},
					TreesitterContextSeparator = { fg = colors.surface2 },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
