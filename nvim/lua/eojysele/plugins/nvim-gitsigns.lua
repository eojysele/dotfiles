return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				require("eojysele.keymaps").gitsings_keymaps(bufnr, gs)
			end
		})
	end
}
