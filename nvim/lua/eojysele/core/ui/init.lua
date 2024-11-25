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
	severity_sort = true,
	float = {
		show_header = true,
		source = "always",
		suffix = "",
	},
	virtual_text = {
		prefix = "",
		spacing = 4,
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
		format = function(diagnostic)
			local max_length = 80
			local symbols = {
				[vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
				[vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
				[vim.diagnostic.severity.INFO] = icons.diagnostics.info,
				[vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
			}

			local message = diagnostic.message
			local severity = diagnostic.severity
			if #message > max_length then
				message = message:sub(1, max_length) .. "..."
			end

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
