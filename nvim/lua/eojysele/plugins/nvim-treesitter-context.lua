return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local ts = require("treesitter-context")
		ts.setup({
			enable = true,
			max_lines = 5,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 1,
			trim_scope = "outer",
			mode = "cursor",
			separator = "─",
			zindex = 20,
			on_attach = function()
				require("eojysele.core.keymaps").ts_context_keymaps()
			end,
		})
	end,
}
