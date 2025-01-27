return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local icons = require("eojysele.core.ui.icons")

		require("nvim-tree").setup({
			on_attach = function(buffer)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(buffer)
				require("eojysele.core.keymaps").tree_keymaps(buffer)
			end,
			filters = {
				git_ignored = true,
			},
			view = {
				adaptive_size = true,
				number = true,
				relativenumber = true,
				signcolumn = "yes",
			},
			renderer = {
				group_empty = true,
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
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.ERROR,
				},
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
				},
			},
		})
	end,
}
