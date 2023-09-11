-- Markdown
require 'lspconfig'.marksman.setup {}

-- Lua
require 'lspconfig'.lua_ls.setup {}

-- HTML
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup {
    capabilities = capabilities,
}

-- JSON
require 'lspconfig'.jsonls.setup {
    capabilities = capabilities,
}

-- XML
require 'lspconfig'.lemminx.setup {}
