return {
	"sindrets/diffview.nvim",
	config = function()
		local icons = require("eojysele.core.ui.icons")
		require("diffview").setup({
			icons = {
				folder_closed = icons.folder.default,
				folder_open = icons.folder.open,
			},
		})
	end,
}
