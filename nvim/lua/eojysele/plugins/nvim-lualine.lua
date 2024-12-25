return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")

		-- Colorscheme: Catpuccin Frappe
		local colors = require("eojysele.core.ui.colors").get_palette()
		local icons = require("eojysele.core.ui.icons")

		local config = {
			options = {
				icons_enabled = true,
				section_separators = "",
				component_separators = "",
				ignore_focus = { "NvimTree" },
				theme = {
					normal = {
						c = { fg = colors.text, bg = colors.mantle },
						x = { fg = colors.text, bg = colors.mantle },
					},
					incative = {
						c = { fg = colors.text, bg = colors.mantle },
						x = { fg = colors.text, bg = colors.mantle },
					},
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_y = {},
				lualine_z = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_y = {},
				lualine_z = {},
				lualine_x = {},
			},
		}

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			"filetype",
			color = { gui = "bold" },
			icon_only = false,
			padding = { left = 1, right = 1 },
		})

		ins_left({
			"filename",
			path = 0,
			shorting_target = 40,
			color = { fg = colors.text, gui = "bold" },
			symbols = {
				modified = icons.file.modified,
				readonly = icons.file.readonly,
				unnamed = "",
				newfile = "",
			},
			padding = { left = 1, right = 1 },
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = {
				error = icons.diagnostics.error .. " ",
				warn = icons.diagnostics.warn .. " ",
				info = icons.diagnostics.info .. " ",
				hint = icons.diagnostics.hint .. " ",
			},
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"location",
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"progress",
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false,
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"encoding",
			fmt = string.upper,
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"branch",
			icon = icons.git.branch,
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		lualine.setup(config)
	end,
}
