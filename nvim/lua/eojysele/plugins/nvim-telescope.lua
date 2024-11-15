return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup {
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						preview_cutoff = 32,
					},
					width = 0.7,
					height = 0.9,
				},
				dynamic_preview_title = true,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				}
			}
		}

		telescope.load_extension("fzf")
	end
}
