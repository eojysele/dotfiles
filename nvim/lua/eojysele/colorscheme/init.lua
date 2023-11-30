require("catppuccin").setup({
    flavour = "frappe",
    integrations = {
        treesitter = true,
        nvimtree = true,
        symbols_outline = true,
        dap = {
            enabled = true,
        },
    },
})

vim.cmd.colorscheme "catppuccin"

local signs = {
    DiagnosticSignError = "",
    DiagnosticSignWarn = "",
    DiagnosticSignHint = "",
    DiagnosticSignInfo = "",
    DapBreakpoint = "",
    DapBreakpointCondition = "",
    DapLogPoint = "",
    DapStopped = "",
    DapBreakpointRejected = ""
}

for type, icon in pairs(signs) do
    local hl = type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
