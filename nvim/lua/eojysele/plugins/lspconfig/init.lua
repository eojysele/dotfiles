local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Markdown
require 'lspconfig'.marksman.setup {
    capabilities = capabilities,
}

-- Lua
require 'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
}

-- HTML
require 'lspconfig'.html.setup {
    capabilities = capabilities,
}

-- JSON
require 'lspconfig'.jsonls.setup {
    capabilities = capabilities,
}

-- XML
require 'lspconfig'.lemminx.setup {
    capabilities = capabilities,
}
