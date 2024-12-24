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
						c = { fg = colors.text, bg = colors.base },
						x = { fg = colors.text, bg = colors.base },
					},
					incative = {
						c = { fg = colors.text, bg = colors.base },
						x = { fg = colors.text, bg = colors.base },
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

		local function ins_inactive_left(component)
			table.insert(config.inactive_sections.lualine_c, component)
		end

		local function ins_inactive_right(component)
			table.insert(config.inactive_sections.lualine_x, component)
		end

		local function get_color_by_mode(vim_mode)
			local mode_color = {
				n = colors.blue,
				i = colors.green,
				v = colors.mauve,
				V = colors.mauve,
				[""] = colors.mauve,
				c = colors.peach,
				R = colors.red,
			}
			return { fg = colors.base, bg = mode_color[vim_mode], gui = "bold" }
		end

		local vim_mode_section = {
			function()
				return icons.logo.neovim
			end,
			color = function()
				return get_color_by_mode(vim.fn.mode())
			end,
			padding = { left = 1, right = 1 },
		}

		ins_left(vim_mode_section)

		ins_left({
			"branch",
			icon = icons.git.branch,
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_left({
			"filetype",
			color = { gui = "bold" },
			icon_only = true,
			padding = { left = 1, right = 0 },
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
			padding = { left = 0, right = 1 },
		})

		ins_left({
			"diff",
			symbols = {
				added = icons.git.diff.staged .. " ",
				modified = icons.git.diff.unstaged .. " ",
				removed = icons.git.diff.deleted .. " ",
			},
			padding = { left = 1, right = 1 },
		})

		ins_right({
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
			"encoding",
			fmt = string.upper,
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
			"location",
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"progress",
			color = { fg = colors.text, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_inactive_left(vim_mode_section)

		lualine.setup(config)
	end,
}
