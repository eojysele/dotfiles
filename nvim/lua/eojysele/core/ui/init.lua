local icons = require("eojysele.core.ui.icons")

local signs = {
	DiagnosticSignError = icons.diagnostics.error,
	DiagnosticSignWarn = icons.diagnostics.warn,
	DiagnosticSignHint = icons.diagnostics.hint,
	DiagnosticSignInfo = icons.diagnostics.info,
}

for type, icon in pairs(signs) do
	local hl = type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	float = {
		show_header = true,
		source = "always",
		suffix = "",
	},
	severity_sort = true,
	virtual_text = false
})

-- set all floating preview rounded border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
