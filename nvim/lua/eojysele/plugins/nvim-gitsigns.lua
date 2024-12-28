return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")
		gs.setup({
			on_attach = function(buffer)
				require("eojysele.core.keymaps").gitsings_keymaps()
			end,
		})
	end,
}
