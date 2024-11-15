return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local ts = require("treesitter-context")
		ts.setup {
			enable = true,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = 'outer',
			mode = 'cursor',
			separator = '─',
			zindex = 20,
			on_attach = function(buf)
				require("eojysele.core.keymaps").ts_context_keymaps(buf, ts)
			end
		}
	end
}
