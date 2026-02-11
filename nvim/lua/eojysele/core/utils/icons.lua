local I = {
	listchars = {
		space = "·",
		trail = "·",
		tab = "│ ",
		eol = "󱞦",
	},
	file = {
		default = "",
		symlink = {
			default = "",
			arrow = "",
		},
		modified = "",
		readonly = "",
		bookmark = "",
	},
	folder = {
		default = "",
		open = "",
		symlink = "",
		arrow_open = "",
		arrow_close = "",
	},
	diagnostics = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
	git = {
		branch = "",
		diff = {
			staged = "",
			unstaged = "",
			deleted = "",
			unmerged = "󱋯",
			renamed = "",
			untracked = "",
			ignored = "",
		},
	},
	logo = {
		vim = "",
		neovim = "",
	},
}

return I
