local icons = require("eojysele.core.ui.icons")

local diagnostics = {
	[vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
	[vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
	[vim.diagnostic.severity.INFO] = icons.diagnostics.info,
	[vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
}

vim.diagnostic.config({
	severity_sort = true,
	float = {
		show_header = true,
		source = "always",
		suffix = "",
	},
	signs = {
		text = diagnostics,
	},
	virtual_text = {
		prefix = "",
		spacing = 4,
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
		format = function(diagnostic)
			local symbols = diagnostics
			local message = diagnostic.message
			local severity = diagnostic.severity

			return string.format("%s %s ", symbols[severity], message)
		end,
		signs = true,
		update_in_insert = false,
	},
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
