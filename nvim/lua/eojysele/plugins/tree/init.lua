local icons = require("eojysele.colorscheme.icons")

require("nvim-tree").setup({
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')
		api.config.mappings.default_on_attach(bufnr)
		require("eojysele.keymaps").tree_keymaps(bufnr)
	end,
	view = {
		adaptive_size = true,
		number = true,
		relativenumber = true,
		signcolumn = "yes",
	},
	renderer = {
		root_folder_label = ":~:t?$?/..?",
		icons = {
			symlink_arrow = " " .. icons.file.symlink.arrow .. " ",
			glyphs = {
				default = icons.file.default,
				symlink = icons.file.symlink.default,
				modified = icons.file.modified,
				bookmark = icons.file.bookmark,
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = icons.folder.default,
					open = icons.folder.open,
					empty = icons.folder.default,
					empty_open = icons.folder.open,
					symlink = icons.folder.symlink,
					symlink_open = icons.folder.symlink,
				},
				git = {
					unstaged = icons.git.diff.unstaged,
					staged = icons.git.diff.staged,
					unmerged = icons.git.diff.unmerged,
					renamed = icons.git.diff.renamed,
					untracked = icons.git.diff.untracked,
					deleted = icons.git.diff.deleted,
					ignored = icons.git.diff.ignored,
				}
			}
		}
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = icons.diagnostics.hint,
			info = icons.diagnostics.info,
			warning = icons.diagnostics.warn,
			error = icons.diagnostics.error,
		},
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		}
	}
})
