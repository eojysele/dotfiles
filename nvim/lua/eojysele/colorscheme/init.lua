require("catppuccin").setup({
    flavour = "frappe",
    integrations = {
        treesitter = true,
        nvimtree = true,
        dap = {
            enabled = true,
        },
        mason = true,
    },
})

vim.cmd.colorscheme "catppuccin"

local signs = {
    DiagnosticSignError = "",
    DiagnosticSignWarn = "",
    DiagnosticSignHint = "",
    DiagnosticSignInfo = "",
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

require("eojysele.colorscheme.groups")
